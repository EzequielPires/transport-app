import 'package:app/core/services/api_service.dart';
import 'package:app/injections/auth_injection.dart';
import 'package:app/layers/data/repositories/freight_repository_remote.dart';
import 'package:app/layers/domain/entities/freight_request.dart';
import 'package:app/layers/domain/repositories/freight_repository.dart';
import 'package:app/layers/presentation/widgets/card_my_package.dart';
import 'package:flutter/material.dart';

class ItinerariesPage extends StatefulWidget {
  const ItinerariesPage({super.key});

  @override
  State<ItinerariesPage> createState() => _ItinerariesPageState();
}

class _ItinerariesPageState extends State<ItinerariesPage> {
  final FreightRepositoryRemote _repositoryRemote =
      FreightRepositoryRemote(apiService: authInjec<ApiService>());
  List<FreightRequest> requests = [];
  int total = 0;

  init() async {
    FindFreigtRequestsResponse data = await _repositoryRemote.findAllRequests();
    setState(() {
      requests = data.requests;
      total = data.total;
    });
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
        title: const Text(
          'Meus roteiros',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
        itemCount: requests.length,
        itemBuilder: (context, index) => CardMyPackage(
          request: requests[index],
        ),
      ),
    );
  }
}
