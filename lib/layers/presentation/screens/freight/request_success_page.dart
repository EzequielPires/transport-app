import 'package:app/layers/domain/entities/freight_request.dart';
import 'package:app/layers/presentation/screens/freight/freight_view_page.dart';
import 'package:app/layers/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class RequestSuccessPage extends StatefulWidget {
  final FreightRequest request;
  const RequestSuccessPage({super.key, required this.request});

  @override
  State<RequestSuccessPage> createState() => _RequestSuccessPageState();
}

class _RequestSuccessPageState extends State<RequestSuccessPage> {
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
                  builder: (context) => FreightViewPage(
                    id: widget.request.id,
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
