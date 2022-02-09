import 'dart:io';

import 'package:data_collection/get_picture.dart';
import "package:flutter/material.dart";


class Sett extends StatefulWidget {
  const Sett({Key? key, required User value}) : super(key: key);

  @override
  State<Sett> createState() => _SettState();
}

class _SettState extends State<Sett> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Set the Image")),
      
    );
  }
}