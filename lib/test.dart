// ignore_for_file: unused_local_variable

import 'package:data_collection/set_pic.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
  String? selectedValue;
  List<String> items = [
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
                  DropdownButton2(
         value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            iconEnabledColor: Colors.yellow,
            iconDisabledColor: Colors.grey,
            buttonHeight: 50,
            buttonWidth: 160,
            items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                )
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
  DropdownMenuItem buildMenuItems(String item) => DropdownMenuItem(value: item, child: Text(item));
}
