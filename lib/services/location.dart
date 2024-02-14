import 'package:geolocator/geolocator.dart';

class Location{
  late double latitude;
  late double longitude;
  Future<void> getCurrentLocation() async{

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        print('Location permission denied.');
        LocationPermission ask = await Geolocator.requestPermission();
        if (ask == LocationPermission.denied || ask == LocationPermission.deniedForever) {
          print('Location permission denied.');
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
      latitude = position.latitude;
      longitude = position.longitude;
  }
}