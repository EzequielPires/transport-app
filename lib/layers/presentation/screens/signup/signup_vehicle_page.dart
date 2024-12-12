import 'package:app/layers/presentation/screens/signup/signup_success_page.dart';
import 'package:app/layers/presentation/widgets/button.dart';
import 'package:app/layers/presentation/widgets/custom_text_field.dart';
import 'package:app/layers/presentation/widgets/select_bodywork_vehicle.dart';
import 'package:app/layers/presentation/widgets/select_tracker_vehicle.dart';
import 'package:app/layers/presentation/widgets/select_type_vehicle.dart';
import 'package:flutter/material.dart';

class SignupVehiclePage extends StatefulWidget {
  const SignupVehiclePage({super.key});

  @override
  State<SignupVehiclePage> createState() => _SignupVehiclePageState();
}

class _SignupVehiclePageState extends State<SignupVehiclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Veículo',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Cadastre seu Veículo',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              'Adicione as informações do seu veículo para começar a utilizá-lo no sistema. É simples e rápido!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SelectTypeVehicle(),
            const SizedBox(
              height: 16,
            ),
            SelectBodyworkVehicle(),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: TextEditingController(),
              label: 'Capacidade máxima (tonelada)',
              hintText: 'Digite a capacidade',
            ),
            const SizedBox(
              height: 16,
            ),
            SelectTrackerVehicle(),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: TextEditingController(),
              label: 'Placa',
              hintText: 'Digite a placa',
            ),
            const SizedBox(
              height: 32,
            ),
            Button(
              label: 'Continuar',
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignupSuccessPage()),
                (Route<dynamic> route) => false,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Voltar'))
          ],
        ),
      ),
    );
  }
}
