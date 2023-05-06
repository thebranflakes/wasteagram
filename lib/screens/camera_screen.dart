import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? image;

  final picker = ImagePicker();

  void getImage() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 240,
        maxWidth: 320,
        imageQuality: 50);
    image = File(pickedFile!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return SingleChildScrollView(
        child: Center(
          child: ElevatedButton(
            child: const Text('Select Photo'),
            onPressed: () {
              getImage();
            },
          ),
        ),
      );
    } else {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.file(image!),
          SizedBox(height: 40),
          ElevatedButton(
            child: Text('Post It!'),
            onPressed: () {},
          )
        ],
      ));
    }
  }
}
