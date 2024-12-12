import 'package:flutter/material.dart';

String getItineraryStatus(status) {
  switch (status) {
    case 'pending':
      return 'Pendente';
    case 'accepted':
      return 'Aceito';
    case 'delivered':
      return 'Entregue';
    case 'reject':
      return 'Rejeitado';
    case 'canceled':
      return 'Cancelado';
    case 'in_progress':
      return 'Em andamento';
    case 'finished':
      return 'Finalizado';
    default:
      return 'Pendente';
  }
}

Color getItineraryStatusColor(status) {
  switch (status) {
    case 'pending':
      return Colors.orange;
    case 'accepted':
      return Colors.green;
    case 'delivered':
      return Colors.green;
    case 'reject':
      return Colors.red;
    case 'canceled':
      return Colors.red;
    case 'in_progress':
      return Colors.deepPurple;
    case 'finished':
      return Colors.redAccent;
    default:
      return Colors.orange;
  }
}
