import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserAdd extends StatefulWidget {
  @override
  _UserAddState createState() => _UserAddState();
}

class _UserAddState extends State<UserAdd> {
  File? _image; // Variable to hold the selected image

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        actions: [
          TextButton(
            onPressed: () {
              // Action to publish the post
            },
            child: Text('Publish'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Image or video upload area
          GestureDetector(
            onTap: _pickImage, // Trigger image picker when tapped
            child: Container(
              height: 200,
              color: Colors.grey[300],
              child: Center(
                child: _image == null
                    ? Icon(Icons.add, size: 50, color: Colors.grey)
                    : Image.file(_image!, fit: BoxFit.cover, width: double.infinity),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Last',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: _pickImage, // Trigger image picker when the camera icon is pressed
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          // Grid of grey boxes representing previous photos
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(30, (index) {
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey[300],
                  margin: EdgeInsets.all(4),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
