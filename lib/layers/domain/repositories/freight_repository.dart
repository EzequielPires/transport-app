import 'package:app/layers/domain/entities/freight.dart';
import 'package:app/layers/domain/entities/freight_request.dart';

class FindFreightDto {
  final String? city;
  final String? state;
  final int? userId;

  FindFreightDto({this.city, this.state, this.userId});
}

class FindFreigtResponse {
  final List<Freight> freights;
  final int total;

  FindFreigtResponse({required this.freights, required this.total});
}

class FreightRequestResponse {
  bool success;
  String? message;
  FreightRequest? request;

  FreightRequestResponse({required this.success, this.message, this.request});
}

class FindFreigtRequestsResponse {
  final List<FreightRequest> requests;
  final int total;

  FindFreigtRequestsResponse({required this.requests, required this.total});
}

abstract class FreightRepository {
  Future<FindFreigtResponse> findAll({FindFreightDto? query});
  Future<FindFreigtResponse> findAllMe({FindFreightDto? query});
  Future<FindFreigtRequestsResponse> findAllRequests();
  Future<FreightRequestResponse> request(int id);
  Future<FreightRequest?> findOneRequest(int id);
}
