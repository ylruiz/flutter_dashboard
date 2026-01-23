import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/widgets/expanded_container.dart';

class MapContainer extends StatelessWidget {
  const MapContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandedContainer(
      title: 'Map View',
      child: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(51.505, -0.09),
          initialZoom: 13,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.flutter_dashboard',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(51.505, -0.09),
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 32,
                ),
              ),
              Marker(
                point: LatLng(51.51, -0.1),
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.blue,
                  size: 32,
                ),
              ),
              Marker(
                point: LatLng(51.515, -0.08),
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.green,
                  size: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
