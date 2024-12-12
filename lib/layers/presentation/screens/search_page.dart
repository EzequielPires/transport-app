import 'package:app/core/services/api_service.dart';
import 'package:app/layers/data/repositories/freight_repository_remote.dart';
import 'package:app/layers/domain/entities/freight.dart';
import 'package:app/layers/domain/repositories/freight_repository.dart';
import 'package:app/layers/presentation/widgets/card_package.dart';
import 'package:app/layers/presentation/widgets/form_search.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        title: const Text(
          'Fretes disponíveis',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormSearch(),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    '$total fretes disponíveis',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.separated(
              itemBuilder: (context, index) => CardPackage(
                freight: freights[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 16,
              ),
              itemCount: freights.length,
            ),
          ),
        ],
      ),
    );
  }
}
