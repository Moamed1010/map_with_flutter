import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; 

class CustomFlutterMap extends StatefulWidget {
  const CustomFlutterMap({super.key});

  @override
  State<CustomFlutterMap> createState() => _CustomFlutterMapState();
}

class _CustomFlutterMapState extends State<CustomFlutterMap> {
  // تعريف الـ Controller الخاص بـ flutter_map
  final MapController mapController = MapController();

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: const MapOptions(
                // الكاميرا الافتراضية
                initialCenter: LatLng(31.21440, 30.01772),
                initialZoom: 12.0,
              ),
              children: [
                // الخريطة العادية الملونة (بدون Dark Mode)
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.google_map',
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              left: 50,
              right: 60,
              child: ElevatedButton(
                onPressed: () {
                  // تغيير المكان
                  mapController.move(
                    const LatLng(30.014122802689872, 31.217029950766122),
                    6.0,
                  );
                },
                child: const Text('Change Location'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}