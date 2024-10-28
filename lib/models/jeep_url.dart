import 'package:latlong2/latlong.dart';
import 'Jeepney.dart';

class JeepMap {
  List<Jeepney> getJeepneys() {
    // Return a list of Jeepneys each with its own map URL
    return [
      Jeepney(
          jeepneyName: "Checkpoint - Holy Angel - SM Clark",
          fare: 20.0,
          waypoints: [LatLng(15.169524, 120.587500)],
          mapUrl: 'https://api.mapbox.com/styles/v1/kctiru/cm2hzhwp500ke01po5xal4ajg/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia2N0aXJ1IiwiYSI6ImNtMmVhaGxnczBzMmMya3NiZTNmYmc0NGsifQ.X4OpU9Ajb6UvH4DOPneHig'
      ),
      Jeepney(
          jeepneyName: "Villa Pampang - SM Telebastagan",
          fare: 20.0,
          waypoints: [LatLng(15.138498, 120.587384)],
          mapUrl: 'https://api.mapbox.com/styles/v1/kctiru/cm2iolxi800mh01po85al34l7/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia2N0aXJ1IiwiYSI6ImNtMmVhaGxnczBzMmMya3NiZTNmYmc0NGsifQ.X4OpU9Ajb6UvH4DOPneHig'
      ),
      Jeepney(
          jeepneyName: "Marisol - Pampang",
          fare: 20.0,
          waypoints: [LatLng(15.152210, 120.591765)],
          mapUrl: 'https://api.mapbox.com/styles/v1/kctiru/cm2hzi2dn003x01pl13lu1xv5/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia2N0aXJ1IiwiYSI6ImNtMmVhaGxnczBzMmMya3NiZTNmYmc0NGsifQ.X4OpU9Ajb6UvH4DOPneHig'
      ),
      Jeepney(
          jeepneyName: "Main Gate - Friendship",
          fare: 20.0,
          waypoints: [LatLng(15.166509, 120.582834)],
          mapUrl: 'https://api.mapbox.com/styles/v1/kctiru/cm2ip3uad006801py86eygnoe/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia2N0aXJ1IiwiYSI6ImNtMmVhaGxnczBzMmMya3NiZTNmYmc0NGsifQ.X4OpU9Ajb6UvH4DOPneHig'
      ),
    ];
  }
}