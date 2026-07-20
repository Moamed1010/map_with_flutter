import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomFlutterMap extends StatefulWidget {
  const CustomFlutterMap({super.key});

  @override
  State<CustomFlutterMap> createState() => _CustomFlutterMapState();
}

class _CustomFlutterMapState extends State<CustomFlutterMap> {
  final MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    initMarkers();  
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  List<Marker> markers = [];

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
                // 1. الخريطة العادية لازم تكون هي أول طبقة عشان تترسم تحت
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.google_map',
                ),
                // 2. طبقة الماركرز تيجي بعدها عشان تترسم فوق الخريطة
                MarkerLayer(markers: markers),
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
                    15,
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

  void initMarkers() {
    var myMarker = Marker(
      child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
      point: const LatLng(31.21440, 30.01772),
    );
    markers.add(myMarker);
  }
}