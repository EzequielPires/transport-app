import 'package:app/layers/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          centerTitle: true,
          elevation: 2,
          shadowColor: Colors.black45,
          title: const Text(
            'Perfil da empresa',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'PRIMA TRANSPORTADORA',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const Text(
                              'Ativa há 5 anos e 9 meses',
                              style: TextStyle(fontSize: 12),
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
                ),
                TabBar(
                  tabs: <Widget>[
                    Tab(
                      child: Text('Informações'),
                    ),
                    Tab(
                      child: Text('Avaliações'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Card.filled(
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dados gerais',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CustomText(
                            title: 'Razão social',
                            value: 'Fábio Donizete Mariano',
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CustomText(
                            title: 'Nome fantasia',
                            value: 'PRIMA TRANSPORTADORA',
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CustomText(
                            title: 'Ramo',
                            value: 'Transportadora',
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CustomText(
                            title: 'Produtos transportados',
                            value: 'Não informado',
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CustomText(
                            title: 'Fretes ativos',
                            value: '32',
                          ),
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
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Localização',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CustomText(
                            title: 'Cidade',
                            value: 'Uberlândia/MG',
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CustomText(
                            title: 'Endereço',
                            value:
                                'Rua Belarmino Veronezi - 106 - Vila Galhardo',
                          ),
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
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contato',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () => {},
                            child: Row(
                              children: [
                                FaIcon(FontAwesomeIcons.whatsapp),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Text(
                                    'Whatsapp',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right_outlined)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () => {},
                            child: Row(
                              children: [
                                Icon(Icons.phone_outlined),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Text(
                                    'Telefone',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right_outlined)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () => {},
                            child: Row(
                              children: [
                                FaIcon(FontAwesomeIcons.instagram),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Text(
                                    'Instagram',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right_outlined)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
