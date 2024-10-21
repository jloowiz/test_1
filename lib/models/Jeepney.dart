import 'package:latlong2/latlong.dart';

class Jeepney {
  final String jeepneyName;
  final double fare;
  final List<LatLng> waypoints;  // Use this if 'waypoints' are necessary
  final String mapUrl;           // Include the map URL field if needed

  Jeepney({
    required this.jeepneyName,
    required this.fare,
    required this.waypoints,  // Rename 'polyline' to 'waypoints' to unify terms
    required this.mapUrl,     // Ensure map URL is also part of the class
  });
}
