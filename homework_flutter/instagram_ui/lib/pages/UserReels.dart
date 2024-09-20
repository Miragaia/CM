import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../components/Reels.dart';

class UserReels extends StatelessWidget {
  final List<Reels> reelsList = [
    Reels('User 1', 'Great start to the day',
        'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
    Reels('User 2', 'Good morning everyone',
        'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
    Reels('User 3', 'Giveaway time',
        'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
    Reels('User 4', 'Joao Felix edit',
        'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
    Reels('User 5', 'Benfica vs Sporting',
        'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical, 
        itemCount: reelsList.length,
        itemBuilder: (context, index) {
          return reelsList[index];
        },
      ),
    );
  }
}
