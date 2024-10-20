import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LocationPage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _ScreenKey = GlobalKey<ScaffoldState>();
  final List<Jeepney> jeepneys = [
    Jeepney("Balibago - Dau Terminal", 20.0, [LatLng(14.6132, 121.0228)]), // Add more waypoints
    Jeepney("Dau Terminal - SM Clark", 20.0, [LatLng(14.6047, 121.0176)]),
  ];
  final mapController = MapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _ScreenKey,
      body: Stack(
        children: [
          SlidingUpPanel(
            minHeight: 200,
            maxHeight: 300,
            color: Colors.transparent,
            panel: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color.fromARGB(255, 0, 1, 85)!, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(topLeft:Radius.circular(24),topRight:Radius.circular(24)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BarIndicator(),
                  JeepneyDropdown(jeepneys: jeepneys),
                  const StartSearch(),
                  const EndSearch(),
                ],
              ),
            ),
            body: Stack(
              children: [
                Scaffold(
                  body: Stack(
                    children: [
                      FlutterMap(
                        mapController: MapController(),
                        options: MapOptions(
                            initialCenter: const LatLng(15.132505, 120.589862),
                            initialZoom: 18.0,
                            minZoom: 5.0,
                            maxZoom: 23,
                            onMapReady: (){
                              mapController.mapEventStream.listen((evt) {});
                            }
                        ),
                        children: [
                          TileLayer(
                            urlTemplate: 'https://api.mapbox.com/styles/v1/kctiru/cm0y5kdd501fx01pqbuglh9zu/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia2N0aXJ1IiwiYSI6ImNtMHdoeGI5ZDAyNXUyc3ExN2JscW9ieTAifQ.wu7uC5TxznmmslF5u37wzw',
                            maxNativeZoom: 22,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BarIndicator extends StatelessWidget {
  const BarIndicator({super.key,});
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: 40,
        height: 5,
        decoration: const BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
    );
  }
}

class Jeepney {
  final String jeepneyName;
  final double fare;
  final List<LatLng> polyline;

  Jeepney(this.jeepneyName, this.fare, this.polyline);
}

class JeepneyDropdown extends StatefulWidget {
  final List<Jeepney> jeepneys;
  const JeepneyDropdown({required this.jeepneys, super.key});
  @override
  _JeepneyDropdownState createState() => _JeepneyDropdownState();
}

class _JeepneyDropdownState extends State<JeepneyDropdown> {
  String? _selectedJeepneyName;
  Jeepney? _selectedJeepney;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: DropdownButtonFormField<String>(
        value: _selectedJeepneyName,
        onChanged: (value) {
          setState(() {
            _selectedJeepneyName = value;
            _selectedJeepney = widget.jeepneys.firstWhere(
                    (jeepney) => jeepney.jeepneyName == value);
          });
        },
        items: widget.jeepneys.map((jeepney) {
          return DropdownMenuItem<String>(
            value: jeepney.jeepneyName,
            child: Text(
              jeepney.jeepneyName,
              style: TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: 'Select Jeepney',
          labelStyle: TextStyle(color: const Color.fromARGB(179, 255, 255, 255)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

class StartSearch extends StatelessWidget {
  const StartSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Start Location',
          labelStyle: TextStyle(color: const Color.fromARGB(179, 255, 255, 255)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

class EndSearch extends StatelessWidget {
  const EndSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Destination Location',
          labelStyle: TextStyle(color: const Color.fromARGB(179, 255, 255, 255)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
