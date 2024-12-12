/* import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:projectgetx/injections/itinerary_injection.dart';
import 'package:projectgetx/layers/data/datasources/itinerary_datasource.dart';
import 'package:projectgetx/layers/data/localdatabase/itinerary_local.dart';

class ConnectivityService {
  static final Connectivity _connectivity = Connectivity();
  static final StreamController<bool> _connectivityController =
      StreamController<bool>.broadcast();

  static Stream<bool> get connectivityStream => _connectivityController.stream;

  static Future<void> initialize() async {
    (await Connectivity().checkConnectivity()).first;

    _connectivity.onConnectivityChanged.listen(
      (event) async {
        bool isConnected = event.first != ConnectivityResult.none;
        _connectivityController.add(isConnected);
        print(isConnected ? 'online' : 'offiline');

        if (isConnected) {
          await _syncPendingDeliveries();
        }
      },
    );
  }

  static Future<void> _syncPendingDeliveries() async {
    try {
      final pendingDeliveries =
          await injec<ItineraryLocal>().getPendingDeliveries();

      for (var delivery in pendingDeliveries) {
        try {
          await injec<ItineraryDatasource>().lowDelivery(
            delivery['cnpj'] ?? '',
            delivery['itinerary_id'],
            delivery['position'],
            delivery['status'] == 'delivered' ? 'E' : 'X',
            delivery['reason'],
          );

          await injec<ItineraryLocal>().updateDeliveryStatusAndMarkAsSynced(
            delivery['itinerary_id'],
            delivery['position'],
            delivery['status'],
          );
        } catch (e) {
          print("Erro ao sincronizar: $e");
        }
      }
    } catch (e) {
      print("Erro ao sincronizar: $e");
    }
  }

  static Future<bool> isConnected() async {
    ConnectivityResult result =
        (await Connectivity().checkConnectivity()).first;
    return result != ConnectivityResult.none;
  }

  static void dispose() {
    _connectivityController.close();
  }
}
 */