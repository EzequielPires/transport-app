import 'package:app/core/helpers/masks.dart';
import 'package:app/layers/presentation/screens/signup/signup_vehicle_page.dart';
import 'package:app/layers/presentation/widgets/button.dart';
import 'package:app/layers/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupAddressPage extends StatefulWidget {
  const SignupAddressPage({super.key});

  @override
  State<SignupAddressPage> createState() => _SignupAddressPageState();
}

class _SignupAddressPageState extends State<SignupAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Endereço',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Insira seu Endereço',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              'Precisamos do endereço para localizar sua região e facilitar o cadastro.',
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: TextEditingController(),
                    label: 'CEP',
                    hintText: 'Digite o CEP',
                    inputFormatters: [cepFormatter],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: 58,
                  height: 58,
                  child: IconButton.filled(
                    onPressed: () => {},
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                        Colors.black87,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    icon: Icon(Icons.search),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Card.outlined(
              color: Colors.transparent,
              margin: EdgeInsets.zero,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.home_outlined),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CEP: 75705-020'),
                          Text(
                              'Rua José da R. Pena - Ipanema, Catalão - Goiás'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Button(
              label: 'Continuar',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupVehiclePage(),
                ),
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
