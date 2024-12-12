import 'package:app/core/helpers/date.dart';
import 'package:app/core/services/api_service.dart';
import 'package:app/injections/auth_injection.dart';
import 'package:app/layers/data/repositories/freight_repository_remote.dart';
import 'package:app/layers/domain/entities/freifht_event.dart';
import 'package:app/layers/domain/entities/freight_request.dart';
import 'package:app/layers/presentation/screens/freight/report_event_page.dart';
import 'package:app/layers/presentation/screens/freight/widgets/route_map.dart';
import 'package:app/layers/presentation/screens/freight/widgets/waiting_response_span.dart';
import 'package:app/layers/presentation/widgets/button.dart';
import 'package:app/layers/presentation/widgets/card_my_package.dart';
import 'package:flutter/material.dart';

class FreightViewPage extends StatefulWidget {
  final FreightRequest? request;
  final int id;
  const FreightViewPage({super.key, required this.id, this.request});

  @override
  State<FreightViewPage> createState() => _FreightViewPageState();
}

class _FreightViewPageState extends State<FreightViewPage> {
  final FreightRepositoryRemote _repositoryRemote =
      FreightRepositoryRemote(apiService: authInjec<ApiService>());
  FreightRequest? request;
  bool loading = true;
  bool error = false;

  init() async {
    FreightRequest? res = await _repositoryRemote.findOneRequest(widget.id);
    if (res != null) {
      setState(() {
        loading = false;
        request = res;
      });
    } else {
      setState(() {
        error = true;
      });
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.black45,
        title: const Text(
          'Frete SPCE-4856',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : error
                ? Center(
                    child: Text('Frete não foi encontrado'),
                  )
                : request != null
                    ? Column(
                        children: [
                          CardMyPackage(
                            request: request!,
                            disabled: true,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          request!.status == RequestStatus.aceito
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Button(
                                      label: 'Iniciar Trajeto',
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RouteMap(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 58,
                                      child: TextButton.icon(
                                        onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ReportEventPage(),
                                          ),
                                        ),
                                        icon: const Icon(Icons.report_outlined),
                                        label: const Text(
                                          'Reportar Eventos',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ...events
                                        .map((e) => Card.filled(
                                              color: Colors.white,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                width: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      e.type,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      e.obs,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      formatDateAndTime(
                                                          e.createdAt),
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ],
                                )
                              : Column(
                                  children: [
                                    WaitingResponseSpan(),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 58,
                                      child: TextButton.icon(
                                        onPressed: handleCancelRequest,
                                        icon: const Icon(Icons.cancel_outlined),
                                        label: const Text(
                                          'Cancelar Solicitação',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      )
                    : Container(),
      ),
    );
  }

  handleCancelRequest() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Cancelar Solicitação'),
        content: const Text('Deseja mesmo cancelar essa solicitação?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
