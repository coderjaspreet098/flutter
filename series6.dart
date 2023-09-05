import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;

  Future<void> _getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> _getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          if (_image != null)
            Image.file(
              _image!,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          SizedBox(height: 40,),
          ElevatedButton(
            onPressed: _getImageFromCamera,
            child: Text("Pick Image from Camera"),
          ),
          ElevatedButton(
            onPressed: _getImageFromGallery,
            child: Text("Pick Image from Gallery"),
          ),
        ],
      ),
    );
  }
}

