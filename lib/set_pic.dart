// ignore_for_file: unnecessary_null_comparison

import 'package:data_collection/get_picture.dart';
import 'package:data_collection/test.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class User {
  final String name;
  const User({required this.name});
}

class Sett extends StatefulWidget {
  final Users value;
  const Sett({Key? key, required this.value}) : super(key: key);

  @override
  State<Sett> createState() => _SettState();
}

class _SettState extends State<Sett> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Set the Image")),
      body: Center(
          child: SvgPicture.asset(
        widget.value.name,
        height: size.height * 0.4,
        width: size.width * 0.4,
      )),
      floatingActionButton: FloatingActionButton(tooltip: "add image",onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Test(value: User(name: widget.value.name))));
      }),
    );
  }
}
