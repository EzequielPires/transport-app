import 'package:app/core/helpers/date.dart';
import 'package:app/layers/domain/entities/freight_request.dart';
import 'package:app/layers/presentation/screens/freight/freight_view_page.dart';
import 'package:flutter/material.dart';

class CardMyPackage extends StatelessWidget {
  final FreightRequest request;
  final bool disabled;
  const CardMyPackage(
      {super.key, required this.request, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: InkWell(
        onTap: !disabled
            ? () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FreightViewPage(
                    id: request.id,
                  ),
                ))
            : null,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: request.status.color,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  request.status.displayName,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      formatFullDate(request.freight.createdAt.toString()),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/company-logo.png',
                    width: 100,
                    height: 48,
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
                              width: 1,
                              color: Colors.grey.shade500,
                            ),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: 1,
                        height: 32,
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
                            width: 1,
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
                        '${request.freight.origin.city} - ${request.freight.origin.state}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${request.freight.destination.city} - ${request.freight.destination.state}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      '256 KM',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      '989 KG',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
