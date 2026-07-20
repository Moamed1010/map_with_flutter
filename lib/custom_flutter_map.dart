import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_example/palce_model.dart';
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
                initialCenter: LatLng(30.038194132241735, 31.211486561187183),
                initialZoom: 12.0,
              ),
              children: [
                // 1. الخريطة العادية لازم تكون هي أول طبقة عشان تترسم تحت
                TileLayer(
                  urlTemplate: 'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
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
                    const LatLng(30.02394817324914, 31.216079998252123),
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
    var myMarker = places
        .map(
          (place) => Marker(
            child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
            point: place.location,
          ),
        )
        .toList();
    markers.addAll(myMarker);
  }
}
