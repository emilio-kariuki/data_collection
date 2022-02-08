// ignore_for_file: prefer_const_constructors

import 'dart:io';

import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';

class Picture extends StatefulWidget {
  const Picture({Key? key}) : super(key: key);

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  File? _image;
  ImagePicker picker = ImagePicker();

  Future getImage() async {
    var image = await picker.pickImage(
        source: ImageSource.camera, maxHeight: 252.0, maxWidth: 400.0);

    setState(() {
      _image = image as File?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("File image picking")),
      body: Center(
          child: _image == null
              ? Text("No image selected")
              : Image.file(_image!, height: 120, width: 120)),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: "pick Image",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
