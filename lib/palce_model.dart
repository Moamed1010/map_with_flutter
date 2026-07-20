import 'package:latlong2/latlong.dart';

class PlaceModel {
  final int id;
  final LatLng location;
  final String name;

  PlaceModel({required this.id, required this.location, required this.name});
}

List<PlaceModel> places = [
  PlaceModel(
    id: 1,
    location: LatLng(30.04131488160759, 31.200148330457278),
    name: "دار الطب للخدمات العلاجيه للاطفال الأنابيب والحقن المجهري",
  ),
  PlaceModel(
    id: 2,
    location: LatLng(30.04116387986909, 31.211370271641233),
    name: "مستشفى ابن سينا التخصصى",
  ),
  PlaceModel(
    id: 2,
    location: LatLng(30.0444405826973, 31.218383862512887),
    name: 'مستشفي مصر الدولي Misr International Hospital',
  ),
];
