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
  List<LatLng> points = [
    places[0].location,
    places[1].location,
    places[2].location,
    places[0].location
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FlutterMap(
          mapController: mapController,
          options: const MapOptions(
            // الكاميرا الافتراضية
            initialCenter: LatLng(30.038194132241735, 31.211486561187183),
            initialZoom: 15,
          ),
          children: [
         
            TileLayer(
              urlTemplate:
                  'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
              userAgentPackageName: 'com.example.google_map',
            ),
            _buildPolylineLayer(points),
            // 2. طبقة الماركرز تيجي بعدها عشان تترسم فوق الخريطة
            MarkerLayer(markers: markers),
          ],
        ),
      ),
    );
  }

Widget _buildPolylineLayer(List<LatLng> points) {
    return PolylineLayer(
      polylines: [
        Polyline(
          points: points,
          strokeWidth: 4.0,
          color: Colors.blueAccent,
        ),
      ],
    );
  }
  void initMarkers() {
    var myMarker = places.map((place) {
      return Marker(
        width: 30,
        height: 30,
        point: place.location,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  height: 150,
                  width: double.infinity,
                  child: Text(
                    place.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
        ),
      );
    }).toList();

    // يفضل تحطها جوه setState عشان لو الداتا اتحدثت بعدين الخريطة تحس بيها
    setState(() {
      markers.addAll(myMarker);
    });
  }
}
