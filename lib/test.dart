// ignore_for_file: unused_local_variable

import 'package:data_collection/set_pic.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class Test extends StatefulWidget {
  final User value;
  const Test({Key? key, required this.value}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:  Text("Test Page",),
      ),
      body: Center(
          child:
              Text(date == null ? "No date has been picked" : date.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDatePicker(
              context: context,
              initialDate: date ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2023)
              ).then((value) => date = value);
        },
      ),
    );
  }
}
