import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/services/weather.dart';
import 'dart:convert';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Position? currentPosition;
  late double latitude;
  late double longitude;
  @override
  void initState() {
    super.initState();
    // Call the asynchronous method in initState
    getLocationData();
  }

  void getLocationData()async {
    WeatherModel weatherModel = await WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>
        LocationScreen(locationWeather: weatherData,)
    ));

  }
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100,
      ),
    );
  }
}

// try {
//   LocationPermission permission = await Geolocator.checkPermission();
//
//   if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
//     LocationPermission ask = await Geolocator.requestPermission();
//     if (ask == LocationPermission.denied || ask == LocationPermission.deniedForever) {
//       print('Location permission denied.');
//     }
//   } else {
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//     print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
//   }
// } catch (e) {
//   print('Error getting location: $e');
// }