import 'package:flutter/material.dart';

class WaitingResponseSpan extends StatelessWidget {
  const WaitingResponseSpan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1), // Fundo laranja suave
        borderRadius: BorderRadius.circular(8), // Bordas arredondadas
        border: Border.all(
          color: Colors.orange, // Borda laranja
          width: 1.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aguardando Resposta',
                  style: TextStyle(
                    color: Colors.orange.shade700,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Sua solicitação está em análise. Por favor, aguarde enquanto processamos sua resposta.',
                  style: TextStyle(
                    color: Colors.orange.shade700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
