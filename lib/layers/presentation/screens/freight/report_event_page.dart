import 'package:app/layers/presentation/widgets/button.dart';
import 'package:app/layers/presentation/widgets/custom_text_field.dart';
import 'package:app/layers/presentation/widgets/select_event.dart';
import 'package:flutter/material.dart';

class ReportEventPage extends StatefulWidget {
  const ReportEventPage({super.key});

  @override
  State<ReportEventPage> createState() => _ReportEventPageState();
}

class _ReportEventPageState extends State<ReportEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
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
        child: Column(
          children: [
            SelectEvent(),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: TextEditingController(),
              label: 'Observações',
              maxLines: 4,
              hintText: 'Descreva o evento a ser relatado',
            )
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        color: Colors.white,
        child: Button(
          label: 'Continuar',
          onPressed: () {},
        ),
      ),
    );
  }
}
