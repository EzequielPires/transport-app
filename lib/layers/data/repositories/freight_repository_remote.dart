import 'package:app/core/services/api_service.dart';
import 'package:app/layers/domain/entities/freight.dart';
import 'package:app/layers/domain/entities/freight_request.dart';
import 'package:app/layers/domain/repositories/freight_repository.dart';

class FreightRepositoryRemote implements FreightRepository {
  final ApiService apiService;

  FreightRepositoryRemote({required this.apiService});

  @override
  Future<FindFreigtResponse> findAll({FindFreightDto? query}) async {
    try {
      var response = await apiService.get('freights');

      var data = response['data'] as List;
      List<Freight> freights = data.map((e) => Freight.fromJson(e)).toList();

      return FindFreigtResponse(
        freights: freights,
        total: response['total'] ?? freights.length,
      );
    } catch (error) {
      print(error);
      return FindFreigtResponse(freights: [], total: 0);
    }
  }

  @override
  Future<FindFreigtResponse> findAllMe({FindFreightDto? query}) async {
    try {
      var response = await apiService.get('freights/me');

      var data = response['data'] as List;
      List<Freight> freights = data.map((e) => Freight.fromJson(e)).toList();

      return FindFreigtResponse(
        freights: freights,
        total: response['total'] ?? freights.length,
      );
    } catch (error) {
      print(error);
      return FindFreigtResponse(freights: [], total: 0);
    }
  }

  @override
  Future<FreightRequestResponse> request(int id) async {
    try {
      var response = await apiService.post('requests/freight/$id');
      FreightRequest? request = await findOneRequest(response['data']['id']);
      return FreightRequestResponse(success: true, request: request);
    } catch (error) {
      return FreightRequestResponse(success: false, message: error.toString());
    }
  }

  @override
  Future<FindFreigtRequestsResponse> findAllRequests() async {
    try {
      var response = await apiService.get('requests/me');

      var data = response['data'] as List;
      List<FreightRequest> requests =
          data.map((e) => FreightRequest.fromJson(e)).toList();

      return FindFreigtRequestsResponse(
        requests: requests,
        total: response['total'] ?? requests.length,
      );
    } catch (error) {
      print(error);
      return FindFreigtRequestsResponse(requests: [], total: 0);
    }
  }

  @override
  Future<FreightRequest?> findOneRequest(int id) async {
    try {
      var response = await apiService.get('requests/$id');

      FreightRequest request = FreightRequest.fromJson(response['data']);

      return request;
    } catch (error) {
      print(error);

      return null;
    }
  }
}
