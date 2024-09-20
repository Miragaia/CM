import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../components/UserPosts.dart';
import '../components/MessageScreen.dart';
import '../components/CameraScreen.dart';
import '../components/NotificationsScreen.dart';

class UserHome extends StatelessWidget {
  // Function to open the messages zone
  void openMessagesZone(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MessagesScreen(),
      ),
    );
  }

  // Function to open the camera zone
  void openCameraZone(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(),
      ),
    );
  }

  void openNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Instagram'),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                openNotifications(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.send_rounded),
              onPressed: () {
                // Call the function to open messages zone
                openMessagesZone(context);
              },
            ),
          ],
        ),
        body: Column(children: [
          // STORIES
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/50dab922-5d48-4c6b-8725-7fd0755d9334/3a3f2d35-8167-4708-9ef0-bdaa980989f9.png'),
                                  fit: BoxFit.cover))),
                      SizedBox(height: 10),
                      Text('Your Story'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://editorial.uefa.com/resources/0286-191e621cce04-67e752a1fdc3-1000/sl_benfica_vs_fc_porto_-_supercopa_de_portugal.jpeg'),
                                  fit: BoxFit.cover))),
                      SizedBox(height: 10),
                      Text('Di Maria'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNiMEf75vOg0ASuthE9WF75ErtLsFU6j5HJ8fCGUm0pc5qk9Vxbz4Nvhk_4Oc4JCDGnFY&usqp=CAU'),
                                  fit: BoxFit.cover))),
                      SizedBox(height: 10),
                      Text('Raptruista'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://pbs.twimg.com/media/DAAth70WsAEEfn2.jpg:large'),
                                  fit: BoxFit.cover))),
                      SizedBox(height: 10),
                      Text('Dj8Cr8'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.ytimg.com/vi/OcueQzaNayg/maxresdefault.jpg'),
                                  fit: BoxFit.cover))),
                      SizedBox(height: 10),
                      Text('SmileTDM'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://upload.wikimedia.org/wikipedia/commons/c/c2/Beagle_portrait_Camry.jpg'),
                                  fit: BoxFit.cover))),
                      SizedBox(height: 10),
                      Text('Liro'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://www.e-cultura.pt/images/user/image16448553404865.jpg'),
                                  fit: BoxFit.cover))),
                      SizedBox(height: 10),
                      Text('Dillaz'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onHorizontalDragUpdate: (details) {
                // Verificar a direção do movimento horizontal
                if (details.primaryDelta! < 0) {
                  // Deslizando para a esquerda (para abrir a zona de mensagens, se necessário)
                  // Você pode ajustar este limite conforme necessário
                  if (details.primaryDelta! < -1) {
                    // Chame a função para abrir a zona de mensagens
                    openMessagesZone(context);
                  }
                } else if (details.primaryDelta! > 0) {
                  // Deslizando para a direita (pode adicionar lógica adicional se necessário)
                  openCameraZone(context);
                }
              },
              child: ListView(
                children: [
                  UserPosts(name: 'User 1'),
                  UserPosts(name: 'User 2'),
                  UserPosts(name: 'User 3'),
                  UserPosts(name: 'User 4'),
                  UserPosts(name: 'User 5'),
                ],
              ),
            ),
          )
        ]));
  }
}
