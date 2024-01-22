import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> handleLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(const SnackBar(content: Text('Location services are disabled. Please enable the services')));
    // return false;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }
  return true;
}

Future<void> getCurrentPosition(var currentPosition) async {
  final hasPermission = await handleLocationPermission();
  if (!hasPermission) return;
  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) {
    currentPosition = position;
    print('lat long');
    print(currentPosition?.longitude);
    print(currentPosition?.latitude);
  }).catchError((e) {
    debugPrint(e);
  });
}
