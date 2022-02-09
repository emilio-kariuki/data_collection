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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Test Page"),
        ),
        body: Center(
          child: SvgPicture.asset(widget.value.name, width: size.width * 0.4,height: size.height *0.5,),
        ));
  }
}
