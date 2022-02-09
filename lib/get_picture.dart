// ignore_for_file: prefer_const_constructors, await_only_futures, unnecessary_null_comparison

import 'dart:io';

import 'package:data_collection/set_pic.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class User {
  String name;
  User({required this.name});
}

class Picture extends StatefulWidget {
  const Picture({Key? key}) : super(key: key);

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
   File? image;
  ImagePicker picker = ImagePicker();

  Future getImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 720,
        maxWidth: 720,
        imageQuality: 100);
    try {
      if (image == null) return;
      
      final imageTempo = File(image.path);
      setState(() async{
        this.image = await imageTempo;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("File image picking")),
      body: Center(
          child: image == null
              ? Text("No image selected")
              : Image.file(image!, height: 120, width: 120)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getImage();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Sett(value: User(name: "assets/eco.jpeg"))));
          });
        },
        tooltip: "pick Image",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
