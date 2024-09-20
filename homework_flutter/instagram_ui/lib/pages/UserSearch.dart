import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UserSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: Colors.grey[300],
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(30, (index) {
            return Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(255, 179, 176, 175),
              margin: EdgeInsets.all(4),
            );
          }),
        ));
  }
}
