import 'package:app/core/services/api_service.dart';
import 'package:app/injections/auth_injection.dart';
import 'package:app/layers/data/repositories/freight_repository_remote.dart';
import 'package:app/layers/domain/entities/freight.dart';
import 'package:app/layers/presentation/screens/company_page.dart';
import 'package:app/layers/presentation/screens/freight/freight_view_page.dart';
import 'package:app/layers/presentation/screens/freight/widgets/freight_address.dart';
import 'package:flutter/material.dart';

class FreightDetails extends StatefulWidget {
  final Freight freight;
  const FreightDetails({super.key, required this.freight});

  @override
  State<FreightDetails> createState() => _FreightDetailsState();
}

class _FreightDetailsState extends State<FreightDetails> {
  final FreightRepositoryRemote _repositoryRemote =
      FreightRepositoryRemote(apiService: authInjec<ApiService>());

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
        padding: const EdgeInsets.only(bottom: 80),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Segunda-feira, 2 de dezembro',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 16,
              ),
              const Card.filled(
                margin: EdgeInsets.zero,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informações da carga',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Produto',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Diversos',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Espécie',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Diversos',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tipo',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Completo',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Quantidade de volumes',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Não informado',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Peso unitário',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Não informada',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dimensão unitária',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Não informada',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Card.filled(
                margin: EdgeInsets.zero,
                color: Colors.white,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Veículo e carroceria',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Tipos',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Carreta, Carreta LS, Vanderléia',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Carroceria',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Sider, Baú, Baú Frigorífico, Baú Refrigerado',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              FreightAddress(
                origin: widget.freight.origin,
                destination: widget.freight.destination,
              ),
              const SizedBox(
                height: 16,
              ),
              Card.filled(
                margin: EdgeInsets.zero,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Observações',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'Aqui vai a descrição completa do pacote que deverá ser entregue pelo motorista e todas as especificações.',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.circular(24)),
                            child: const Icon(
                              Icons.send_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rastreador necessário',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Não',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.circular(24)),
                            child: const Icon(
                              Icons.inventory_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Agenciamento',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Não',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Card.filled(
                margin: EdgeInsets.zero,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contratante',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'PRIMA TRANSPORTADORA',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.grey.shade700,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    const Text(
                                      '5.0/5 - 1 avaliação',
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Image.asset(
                            'assets/images/logo.jpg',
                            width: 100,
                            height: 48,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.verified_user,
                            color: Colors.redAccent,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Perfil Verificado',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Nunca cancela viagens',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: OutlinedButton.icon(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            iconColor:
                                const WidgetStatePropertyAll(Colors.black),
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CompanyPage(),
                              )),
                          label: const Text(
                            'Ver perfil completo',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        padding: EdgeInsets.zero,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(width: 1, color: Colors.grey.shade200))),
          child: Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'R\$ 2.500,00',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'R\$ 3,50/Km',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox(
                  width: 16,
                ),
              ),
              SizedBox(
                height: 56,
                child: FilledButton.icon(
                  onPressed: handleFreightRequest,
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(
                      Colors.redAccent,
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  label: const Text(
                    'Tenho interesse',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  handleNavigateToView(id) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FreightViewPage(id: id),
      ));

  handleError(error) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Erro: $error',
            style: const TextStyle(color: Colors.redAccent),
          ),
          backgroundColor: Colors.grey.shade200,
        ),
      );

  handleFreightRequest() async {
    var res = await _repositoryRemote.request(widget.freight.id);
    print(res.success);
    if (res.success && res.request != null) {
      handleNavigateToView(res.request?.id);
    } else {
      handleError(res.message);
    }
  }
}
