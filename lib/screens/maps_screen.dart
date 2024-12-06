import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController _controller;

  final CameraPosition _initialLocation = CameraPosition(
    target: LatLng(37.7749, -122.4194), // Default location: San Francisco
    zoom: 10.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interactive Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialLocation,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        markers: {
          Marker(
            markerId: MarkerId("current_location"),
            position: _initialLocation.target,
          ),
        },
      ),
    );
  }
}
