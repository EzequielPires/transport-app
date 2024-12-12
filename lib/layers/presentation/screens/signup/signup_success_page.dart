import 'package:app/layers/presentation/screens/initial_page.dart';
import 'package:app/layers/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class SignupSuccessPage extends StatelessWidget {
  const SignupSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              'assets/images/icon-success.png',
              height: 200,
            ),
            const Text(
              'Usuário Criado com Sucesso!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              'O cadastro foi realizado com sucesso. Obrigado por usar nosso sistema!',
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
            Button(
              label: 'Continuar',
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const InitialPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
