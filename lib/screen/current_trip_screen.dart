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

  LatLng? _currentP = null;

  // New locations
  static const LatLng _p9ArchBridge = LatLng(6.8768, 81.0608);
  static const LatLng _pEllaRock = LatLng(6.86, 81.04);
  static const LatLng _pFlyingRavana = LatLng(6.8661, 81.0621);
  static const LatLng _pRavanaElla = LatLng(6.8625, 81.0441);
  static const LatLng _pLittleAdamsPeak = LatLng(6.8692, 81.0602);
  static const LatLng _pRavanaCave = LatLng(6.8645, 81.0486);

  // Polyline data
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then((_) => {
      getPolylinePoints().then((coordinates) =>
      {generatePolyLineFromPoints(coordinates)}),
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
            target: _p9ArchBridge,
            zoom: 14,
          ),
          markers: {
            Marker(
                markerId: MarkerId("_currentLocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: _currentP!),
            Marker(
                markerId: MarkerId("_9ArchBridge"),
                icon: BitmapDescriptor.defaultMarker,
                position: _p9ArchBridge),
            Marker(
                markerId: MarkerId("_EllaRock"),
                icon: BitmapDescriptor.defaultMarker,
                position: _pEllaRock),
            Marker(
                markerId: MarkerId("_FlyingRavana"),
                icon: BitmapDescriptor.defaultMarker,
                position: _pFlyingRavana),
            Marker(
                markerId: MarkerId("_RavanaElla"),
                icon: BitmapDescriptor.defaultMarker,
                position: _pRavanaElla),
            Marker(
                markerId: MarkerId("_LittleAdamsPeak"),
                icon: BitmapDescriptor.defaultMarker,
                position: _pLittleAdamsPeak),
            Marker(
                markerId: MarkerId("_RavanaCave"),
                icon: BitmapDescriptor.defaultMarker,
                position: _pRavanaCave),
          },
          polylines: Set<Polyline>.of(polylines.values),
        ),
      ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 14);

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
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });

        // Update polyline points
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

    // Request route with waypoints
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      request: PolylineRequest(
        origin: PointLatLng(_currentP!.latitude, _currentP!.longitude),
        destination: PointLatLng(_pRavanaCave.latitude, _pRavanaCave.longitude),
        wayPoints: [
          PolylineWayPoint(
              location: "${_p9ArchBridge.latitude},${_p9ArchBridge.longitude}"),
          PolylineWayPoint(
              location: "${_pEllaRock.latitude},${_pEllaRock.longitude}"),
          PolylineWayPoint(
              location: "${_pFlyingRavana.latitude},${_pFlyingRavana.longitude}"),
          PolylineWayPoint(
              location: "${_pRavanaElla.latitude},${_pRavanaElla.longitude}"),
          PolylineWayPoint(
              location:
              "${_pLittleAdamsPeak.latitude},${_pLittleAdamsPeak.longitude}"),
        ],
        mode: TravelMode.driving,
      ),
      googleApiKey: GOOGLE_MAPS_API, // Replace with your actual API key
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
      color: AppTheme.colors.secondary_dark_2,
      points: polylineCoordinates,
      width: 8,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }
}
