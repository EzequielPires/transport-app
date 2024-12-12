import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Score extends StatelessWidget {
  const Score({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.zero,
      color: Colors.white,
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seu Score',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'Siga sempre as orientações para um melhor resultado',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            FilledButton.tonal(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.grey.shade200)),
                onPressed: () {},
                child: const Text('Saiba mais')),
            Center(
              child: SizedBox(
                width: 280,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 100,
                      ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 0, endValue: 20, color: Colors.red),
                        GaugeRange(
                            startValue: 20, endValue: 40, color: Colors.orange),
                        GaugeRange(
                            startValue: 40, endValue: 60, color: Colors.yellow),
                        GaugeRange(
                            startValue: 60, endValue: 80, color: Colors.green),
                        GaugeRange(
                            startValue: 80, endValue: 100, color: Colors.purple)
                      ],
                      pointers: const <GaugePointer>[NeedlePointer(value: 90)],
                      annotations: const <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: SizedBox(
                            child: Text(
                              '90.0',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.5,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
