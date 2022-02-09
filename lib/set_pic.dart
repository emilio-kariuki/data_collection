// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:data_collection/get_picture.dart';
import "package:flutter/material.dart";

class Sett extends StatefulWidget {
  final User value;
  const Sett({Key? key, required this.value}) : super(key: key);

  @override
  State<Sett> createState() => _SettState();
}

class _SettState extends State<Sett> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Set the Image")),
      body: Center(
          child: widget.value.name == null
              ? const Text("No image selected")
              : Image.file(widget.value.name, height: 120, width: 120)),
    );
  }
}
