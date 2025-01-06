import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gtec_class_app/bottom_navigation_bar_screen.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? pickedImageFromCamera;
  XFile? pickedImageFromGallery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Demo"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () async {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BottomNavigationBarScreen(),
                ));
                // pickedImageFromCamera =
                //     await picker.pickImage(source: ImageSource.camera);
                // // print(pickedImage!.path);
                // setState(() {});
              },
              child: Container(
                height: 150,
                width: 150,
                color: Colors.grey,
                child: pickedImageFromCamera != null
                    ? Image.file(File(pickedImageFromCamera!.path))
                    : const Icon(Icons.camera),
              ),
            ),
            GestureDetector(
              onTap: () async {
                pickedImageFromGallery =
                    await picker.pickImage(source: ImageSource.gallery);
                if (pickedImageFromGallery != null) {
                  print(pickedImageFromGallery!.path);
                } else {
                  print("You not select any photo from gallery");
                }
                setState(() {});
              },
              child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey,
                  child: pickedImageFromGallery != null
                      ? Image.file(File(pickedImageFromGallery!.path))
                      : const Icon(Icons.photo)),
            )
          ],
        ),
      ),
    );
  }
}
