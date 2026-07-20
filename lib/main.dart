import 'package:flutter/material.dart';
import 'package:flutter_map_example/custom_flutter_map.dart';




void main() {
  runApp(const GoogleMAp());
}

class GoogleMAp extends StatelessWidget {
  const GoogleMAp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomFlutterMap(),
    );
  }
}
