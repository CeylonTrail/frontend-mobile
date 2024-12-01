import 'dart:async';
import 'package:ceylontrailapp/consts.dart';
import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CurrentTripScreen extends StatefulWidget {
  const CurrentTripScreen({super.key});

  @override
  State<CurrentTripScreen> createState() => _CurrentTripScreenState();
}

class _CurrentTripScreenState extends State<CurrentTripScreen> {
  Location _locationController = new Location();
  final Completer<GoogleMapController> _mapController =
  Completer<GoogleMapController>();

  static const LatLng _pUoc = LatLng(6.900777, 79.860133);
  static const LatLng _pPettah = LatLng(6.9368, 79.8525);
  LatLng? _currentP = null;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then((_) => {
      getPolylinePoints().then((coordinates) => {generatePolyLineFromPoints(coordinates)}),
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          title: const Text(
            "Current Trip",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: _currentP == null
            ? Center(
          child: Text(
            "Loading...",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppTheme.colors.primary,
            ),
          ),
        )
            : GoogleMap(
          onMapCreated: ((GoogleMapController controller) =>
              _mapController.complete(controller)),
          initialCameraPosition: CameraPosition(
            target: _pUoc,
            zoom: 12,
          ),
          markers: {
            Marker(
                markerId: MarkerId("_currentLocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: _currentP!),
            Marker(
                markerId: MarkerId("_sourceLocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: _pUoc),
            Marker(
                markerId: MarkerId("_destination"),
                icon: BitmapDescriptor.defaultMarker,
                position: _pPettah),
          },
          polylines: Set<Polyline>.of(polylines.values),
        ),
      ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 12);

    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied ||
        _permissionGranted == PermissionStatus.deniedForever) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });

        // Once the current location is updated, get the polyline
        getPolylinePoints().then((coordinates) {
          generatePolyLineFromPoints(coordinates);
        });

        _cameraToPosition(_currentP!);
      }
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();

    // Create waypoints as PolylineWayPoint using String format for location
    List<PolylineWayPoint> waypoints = [
      PolylineWayPoint(
        location: "${_pUoc.latitude},${_pUoc.longitude}", // Using String format
      ),
    ];

    // Request route with multiple waypoints
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      request: PolylineRequest(
        origin: PointLatLng(_currentP!.latitude, _currentP!.longitude),
        destination: PointLatLng(_pPettah.latitude, _pPettah.longitude),
        wayPoints: waypoints, // Using PolylineWayPoint here
        mode: TravelMode.driving,
      ),
      googleApiKey: GOOGLE_MAPS_API, // Use your actual Google Maps API key
    );

    if (result.points.isNotEmpty) {
      for (PointLatLng point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print(result.errorMessage);
    }

    return polylineCoordinates;
  }



  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: AppTheme.colors.secondary,
      points: polylineCoordinates,
      width: 8,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }
}
