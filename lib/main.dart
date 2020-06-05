import 'package:flutter/material.dart';
import 'package:worldoclock/pages/choose_location.dart';
import 'package:worldoclock/pages/home.dart';
import 'package:worldoclock/pages/loading.dart';

void main() {
  runApp(MaterialApp(
//    home: Home(),

    initialRoute: "/home",
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      "/location": (context) => ChooseLocation(),
    },
  ));
}
