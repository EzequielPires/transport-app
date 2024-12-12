import 'package:app/layers/domain/entities/freight.dart';
import 'package:app/layers/domain/entities/user.dart';
import 'package:flutter/material.dart';

enum RequestStatus {
  pendente,
  aceito,
  rejeitado,
}

extension RequestStatusExtension on RequestStatus {
  String get displayName {
    switch (this) {
      case RequestStatus.pendente:
        return 'Aguardando resposta';
      case RequestStatus.aceito:
        return 'Aceito';
      case RequestStatus.rejeitado:
        return 'Rejeitado';
      default:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case RequestStatus.pendente:
        return Colors.yellow.shade800;
      case RequestStatus.aceito:
        return Colors.green.shade600;
      case RequestStatus.rejeitado:
        return Colors.redAccent;
      default:
        return Colors.grey.shade600;
    }
  }
}

class FreightRequest {
  final int id;
  final Freight freight;
  final User user;
  final RequestStatus status;

  FreightRequest({
    required this.id,
    required this.freight,
    required this.user,
    required this.status,
  });

  factory FreightRequest.fromJson(Map<String, dynamic> json) {
    return FreightRequest(
      id: json['id'],
      freight: Freight.fromJson(json['freight']),
      user: User.fromJson(json['user']),
      status: RequestStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => RequestStatus.pendente,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'freight': freight.toJson(),
      'user': user.toJson(),
      'status': status.name,
    };
  }
}
