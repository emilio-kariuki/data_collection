// ignore_for_file: unused_local_variable

import 'package:data_collection/set_pic.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Test extends StatefulWidget {
  final User value;
  const Test({Key? key, required this.value}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final items = [
    'Emilio',
    "Kariuki",
    "Gichuru",
    "Jane",
    "Rosie",
    "Joy",
    "Kennedy",
    "Peter",
    "Rachel"
  ];
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Page",
            style: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: Column(
        children: [
          Center(
              child: Text(
                  date == null ? "No date has been picked" : date.toString())),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDatePicker(
                  context: context,
                  initialDate: date ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2023))
              .then((value) {
            setState(() {
              date = value;
              date = DateFormat.yMMM().format(date!) as DateTime?;
            });
          });
        },
        child: const Icon(Icons.date_range),
        tooltip: "Pick Date",
      ),
    );
  }
}
