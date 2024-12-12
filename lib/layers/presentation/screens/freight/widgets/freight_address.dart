import 'package:app/layers/domain/entities/address.dart';
import 'package:flutter/material.dart';

class FreightAddress extends StatelessWidget {
  final Address origin;
  final Address destination;

  const FreightAddress({
    super.key,
    required this.origin,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.zero,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Distância',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Expanded(child: Container()),
                const Text(
                  '1010 KM',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.grey.shade500,
                          ),
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: 2,
                      height: 56,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${origin.city}, ${origin.state}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${origin.address}, n° ${origin.address}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      '${destination.city}, ${destination.state}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${destination.address}, n° ${destination.address}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton.icon(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  iconColor: const WidgetStatePropertyAll(Colors.black),
                ),
                onPressed: () {},
                label: const Text(
                  'Ver no mapa',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                icon: const Icon(
                  Icons.map_outlined,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
