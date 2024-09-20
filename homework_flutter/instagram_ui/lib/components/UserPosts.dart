import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UserPosts extends StatelessWidget {
  final String name;

  UserPosts({required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://w0.peakpx.com/wallpaper/979/89/HD-wallpaper-purple-smile-design-eye-smily-profile-pic-face-thumbnail.jpg'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(width: 10),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ],
        ),
      ),
      Container(
        height: 300,
        color: Colors.grey[400],
      ),
      Row(
        children: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.mode_comment_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.send_rounded),
            onPressed: () {},
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () {},
          ),
        ],
      ),
      Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Text('Liked by '),
                  Text('User 1', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(" and "),
                  Text('others', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              )),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 1.0),
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(
                text: name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text:
                    ' My first post! #instagram #HelloWorld #Life #Love #Peace #Joy',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
