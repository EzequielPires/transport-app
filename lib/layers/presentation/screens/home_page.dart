import 'package:app/core/services/api_service.dart';
import 'package:app/layers/data/repositories/freight_repository_remote.dart';
import 'package:app/layers/domain/entities/freight.dart';
import 'package:app/layers/domain/repositories/freight_repository.dart';
import 'package:app/layers/presentation/screens/home/widgets/home_header.dart';
import 'package:app/layers/presentation/screens/search_page.dart';
import 'package:app/layers/presentation/widgets/card_package.dart';
import 'package:app/layers/presentation/widgets/score.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FreightRepositoryRemote _repositoryRemote =
      FreightRepositoryRemote(apiService: ApiService(dio: Dio()));
  List<Freight> freights = [];
  int total = 0;

  init() async {
    FindFreigtResponse data = await _repositoryRemote.findAll();
    setState(() {
      freights = data.freights;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              transform: Matrix4.translationValues(0, -48, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Card.filled(
                      margin: EdgeInsets.zero,
                      elevation: 2,
                      color: Colors.white,
                      child: SizedBox(
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Valor recebido',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              'R\$ 4.500,00',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.green.shade800,
                              ),
                            ),
                            const Text(
                              'Ver detalhes',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Card.filled(
                      margin: EdgeInsets.zero,
                      elevation: 2,
                      color: Colors.white,
                      child: SizedBox(
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Valor à receber',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              'R\$ 1.500,00',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.orange.shade800,
                              ),
                            ),
                            const Text(
                              'Ver detalhes',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, -48, 0),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Fretes perto de você',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                            onPressed: () {}, child: const Text('Ver todos'))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 264,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        padding: index == 0
                            ? const EdgeInsets.only(left: 16)
                            : index == 5
                                ? const EdgeInsets.only(right: 16)
                                : null,
                        constraints: const BoxConstraints(
                            minWidth: 368, maxWidth: double.infinity),
                        child: CardPackage(
                          freight: freights[index],
                        ),
                      ),
                      itemCount: freights.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              transform: Matrix4.translationValues(0, -48, 0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Score(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchPage(),
            )),
        child: const Icon(Icons.search),
      ),
    );
  }
}
