import 'package:app/layers/presentation/widgets/custom_date_input.dart';
import 'package:app/layers/presentation/widgets/select_bodywork_vehicle.dart';
import 'package:app/layers/presentation/widgets/select_city.dart';
import 'package:app/layers/presentation/widgets/select_type_vehicle.dart';
import 'package:flutter/material.dart';

class FormSearch extends StatefulWidget {
  const FormSearch({super.key});

  @override
  State<FormSearch> createState() => _FormSearchState();
}

class _FormSearchState extends State<FormSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              const Expanded(
                child: Row(
                  children: [
                    Text(
                      'São Paulo, SP',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.east,
                      size: 14,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Catalão, GO',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    size: 20,
                  )),
              Container(
                width: 1,
                height: 36,
                color: Colors.grey.shade300,
              ),
              IconButton(
                  onPressed: handleSearchDialog,
                  icon: const Icon(
                    Icons.filter_list_outlined,
                    size: 20,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  handleSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          backgroundColor: Colors.white,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
            ),
            body: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SelectCity(),
                  const SizedBox(
                    height: 16,
                  ),
                  SelectCity(
                    label: 'Destino',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomDateInput(
                    label: 'Data de partida',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SelectTypeVehicle(),
                  const SizedBox(
                    height: 16,
                  ),
                  SelectBodyworkVehicle(),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            bottomSheet: BottomAppBar(
              color: Colors.white,
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(
                      Colors.redAccent,
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.search),
                  label: const Text(
                    'Filtrar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


/* import 'package:app/layers/presentation/screens/search_page.dart';
import 'package:app/layers/presentation/widgets/custom_date_input.dart';
import 'package:app/layers/presentation/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

class FormSearch extends StatelessWidget {
  const FormSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.zero,
      color: Colors.white,
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomDropdown(
              prefixIcon: const Icon(Icons.place_outlined),
              label: 'Origem',
              controller: TextEditingController(),
              dropdownMenuEntries: [],
            ),
            const SizedBox(
              height: 16,
            ),
            CustomDropdown(
              prefixIcon: const Icon(Icons.place_outlined),
              label: 'Destino',
              controller: TextEditingController(),
              dropdownMenuEntries: [],
            ),
            const SizedBox(
              height: 16,
            ),
            CustomDateInput(
              label: 'Data de partida',
              controller: TextEditingController(),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton.icon(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    )),
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(
                    Colors.redAccent,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                ),
                icon: const Icon(Icons.search),
                label: const Text(
                  'Procurar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */