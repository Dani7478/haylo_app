import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.location.request();
    setState(() {
      _permissionStatus = status;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_permissionStatus != PermissionStatus.granted) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Map Example'),
        ),
        body: Center(
          child: Text('Location permission not granted.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Map Example'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: GoogleMap(
          onMapCreated: (controller) {
            setState(() {
              _controller = controller;
            });
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(37.7749, -122.4194), // Set the initial center of the map
            zoom: 12, // Set the initial zoom level
          ),
          myLocationEnabled: true, // Enable the My Location layer
        ),
      ),
    );
  }
}
