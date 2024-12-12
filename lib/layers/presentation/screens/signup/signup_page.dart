import 'package:app/layers/presentation/screens/signup/signup_address_page.dart';
import 'package:app/layers/presentation/widgets/button.dart';
import 'package:app/layers/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Informações',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Crie sua Conta',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              'Comece a entregar hoje mesmo e aproveite todas as oportunidades. É rápido e fácil!',
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
            CustomTextField(
              controller: TextEditingController(),
              label: 'Nome',
              hintText: 'Insira seu nome completo',
              prefixIcon: const Icon(Icons.person_outline),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: TextEditingController(),
              label: 'Telefone',
              hintText: 'Ex.: (00) 00000-0000',
              prefixIcon: const Icon(Icons.phone_outlined),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: TextEditingController(),
              label: 'CPF',
              hintText: 'Ex.: 000.000.000-00',
              prefixIcon: const Icon(Icons.badge_outlined),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: TextEditingController(),
              label: 'Email',
              hintText: 'Insira seu email',
              prefixIcon: const Icon(Icons.mail_outline),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: TextEditingController(),
              label: 'Senha',
              hintText: 'Insira sua senha',
              obscureText: true,
              prefixIcon: const Icon(Icons.lock_outline),
            ),
            const SizedBox(
              height: 16,
            ),
            Button(
              label: 'Continuar',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupAddressPage(),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Já tem uma conta?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
