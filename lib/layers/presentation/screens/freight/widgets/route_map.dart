import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:latlong2/latlong.dart';

class RouteMap extends StatefulWidget {
  const RouteMap({super.key});

  @override
  State<RouteMap> createState() => _RouteMapState();
}

class _RouteMapState extends State<RouteMap> {
  List<LatLng> routePoints = [];
  final LatLng uberlandia = LatLng(-18.9186, -48.2772);
  final LatLng catalao = LatLng(-18.1654, -47.9465);

  @override
  void initState() {
    super.initState();
    _fetchRoute();
  }

  Future<void> _fetchRoute() async {
    final url =
        'https://router.project-osrm.org/route/v1/driving/${uberlandia.longitude},${uberlandia.latitude};${catalao.longitude},${catalao.latitude}?overview=full&geometries=geojson';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final geometry = data['routes'][0]['geometry']['coordinates'];
      final points = geometry.map<LatLng>((point) {
        return LatLng(point[1], point[0]);
      }).toList();

      setState(() {
        routePoints = points;
      });
    } else {
      print('Erro ao buscar a rota: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Rota Uberlândia - Catalão',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      )),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: uberlandia,
          initialZoom: 10.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: routePoints,
                strokeWidth: 4.0,
                color: Colors.black,
              ),
            ],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: uberlandia,
                child: Icon(Icons.location_pin, color: Colors.blueAccent),
              ),
              Marker(
                point: catalao,
                child: Icon(Icons.location_pin, color: Colors.redAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
