import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final ImagePicker picker = ImagePicker();

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
                var pickedImage =
                    await picker.pickImage(source: ImageSource.camera);
                print(pickedImage!.path);
              },
              child: Container(
                height: 150,
                width: 150,
                color: Colors.grey,
                child: Icon(Icons.camera),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var pickedImage1 =
                    await picker.pickImage(source: ImageSource.gallery);
                if (pickedImage1 != null) {
                  print(pickedImage1.path);
                } else {
                  print("You not select any photo from gallery");
                }
              },
              child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey,
                  child: Icon(Icons.photo)),
            )
          ],
        ),
      ),
    );
  }
}
