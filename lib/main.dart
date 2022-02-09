import 'dart:js';

import 'package:data_collection/get_picture.dart';
import 'package:flutter/material.dart';
import "set_pic.dart";

void main() {
  runApp(MaterialApp(
    // home: Picture(),
    initialRoute: "/take",
    routes: {
      "/take": (context) => const Picture(),
      "/set": (context) => const Set(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
