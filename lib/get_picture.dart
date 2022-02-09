// ignore_for_file: prefer_const_constructors

import 'dart:io';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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
      setState(() {
        this.image = imageTempo;
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
            Navigator.pushNamed(context, "/set", arguments: {"image": image});
          });
        },
        tooltip: "pick Image",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
