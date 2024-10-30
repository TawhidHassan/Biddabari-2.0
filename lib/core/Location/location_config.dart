//
// import 'dart:async';
// import 'dart:ffi';
// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:logger/logger.dart';
//
// import '../config/util/text_style.dart';
//
// class LocationConfig{
//
//   Position? possition;
//   LocationPermission? permission;
//   List<Position>? locations = <Position>[];
//
//   LocationConfig(){
//     getCureentLocation();
//   }
//
//
//   Future<List<double>> getCureentLocation()async{
//     Logger().w("click");
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       if(Platform.isIOS){
//         permission = await Geolocator.requestPermission();
//       }else{
//         permission = await Geolocator.requestPermission();
//       }
//
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }else{
//       // getCureentLocation();
//     }
//
//     var possition =Platform.isAndroid?
//     await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low):
//     await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low);
//     Logger().i(possition.latitude);
//
//     return [possition.latitude,possition.longitude];
//
//   }
//
//   Future<String> getCountryFromLatLon(double latitude, double longitude) async {
//     try {
//       // Use the placemarkFromCoordinates function to reverse-geocode the lat-lon
//       List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
//
//       if (placemarks.isNotEmpty) {
//         // The first placemark in the list usually contains the most detailed information
//         Placemark place = placemarks[0];
//
//         // Return the country name
//         Logger().i(place.country);
//         return place.country ?? 'Country not found';
//       } else {
//         return 'No placemarks found';
//       }
//     } catch (e) {
//       print(e);
//       return 'Error occurred';
//     }
//   }
//
//   Future<String?> getlocationName() async {
//     try {
//       // Use the placemarkFromCoordinates function to reverse-geocode the lat-lon
//       var possition =Platform.isAndroid?
//       await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.low):
//       await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.low);
//       Logger().i(possition.latitude);
//       List<Placemark> placemarks = await placemarkFromCoordinates(possition.latitude, possition.longitude);
//
//       if (placemarks.isNotEmpty) {
//         // The first placemark in the list usually contains the most detailed information
//         Placemark place = placemarks[0];
//
//         // Return the country name
//         Logger().i(place.country);
//         return place.administrativeArea!+" "+place.locality!;
//       } else {
//         return 'No placemarks found';
//       }
//     } catch (e) {
//       print(e);
//       return 'Error occurred';
//     }
//   }
//
//
// }