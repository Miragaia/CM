import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'FriendRequestsScreen.dart';

class NotificationsScreen extends StatelessWidget {
  void showFriendRequests(BuildContext context) {
    // abre uma nova pagina de pedidos de amizade
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FriendRequestsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragUpdate: (details) {
            // Verificar a direção do movimento horizontal
            if (details.primaryDelta! < 0) {
              // Deslizando para a esquerda (para abrir a zona de mensagens, se necessário)
            } else if (details.primaryDelta! > 0) {
              // Deslizando da direita para a esquerda sai das mensagens e volta para a home
              Navigator.pop(context);
            }
          },
          child: ListView(
            children: [
              // secçao com os pedidos de amizade do insta é um container que ao clicar abre pop up com os pedidos de amizade para aceitar ou nao
              ListTile(
                leading: Stack(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          'https://w0.peakpx.com/wallpaper/979/89/HD-wallpaper-purple-smile-design-eye-smily-profile-pic-face-thumbnail.jpg'),
                    ),
                    Positioned(
                      right: -15,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(
                            'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
                      ),
                    ),
                  ],
                ),
                title: Text('Friend Requests'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
// Espaço entre o ícone e a bola vermelha
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios_outlined),
                  ],
                ),
                onTap: () {
                  // Ao clicar, exibir os pedidos de amizade
                  showFriendRequests(context);
                },
              ),

              Padding(
                padding: EdgeInsets.all(8),
                child: Text('Today'),
              ),

              Divider(
                height: 1,
                color: Colors.grey,
              ),

              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  // Substitua a imagem abaixo pela imagem do remetente
                  backgroundImage: NetworkImage(
                      'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
                ),
                title: Text('User 1'),
                subtitle: Text('Liked your post'),
                trailing: Icon(Icons.favorite),
              ),
              // secçao ontem
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Yesterday'),
              ),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  // Substitua a imagem abaixo pela imagem do remetente
                  backgroundImage: NetworkImage(
                      'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
                ),
                title: Text('User 2'),
                subtitle: Text('Commented on your post'),
                trailing: Icon(Icons.mode_comment_outlined),
              ),
              // adiciona secçao a dizer na ultima semana
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Last Week'),
              ),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  // Substitua a imagem abaixo pela imagem do remetente
                  backgroundImage: NetworkImage(
                      'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
                ),
                title: Text('User 3'),
                subtitle: Text('Mentioned you in a comment'),
                trailing: Icon(Icons.mode_comment_outlined),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  // Substitua a imagem abaixo pela imagem do remetente
                  backgroundImage: NetworkImage(
                      'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
                ),
                title: Text('User 4'),
                subtitle: Text('Liked your post'),
                trailing: Icon(Icons.favorite),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  // Substitua a imagem abaixo pela imagem do remetente
                  backgroundImage: NetworkImage(
                      'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
                ),
                title: Text('User 5'),
                subtitle: Text('Liked your post'),
                trailing: Icon(Icons.favorite),
              ),
              // adiciona secçao a dizer no ultimo mes
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Last Month'),
              ),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  // Substitua a imagem abaixo pela imagem do remetente
                  backgroundImage: NetworkImage(
                      'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
                ),
                title: Text('User 6'),
                subtitle: Text('Liked your post'),
                trailing: Icon(Icons.favorite),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  // Substitua a imagem abaixo pela imagem do remetente
                  backgroundImage: NetworkImage(
                      'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
                ),
                title: Text('User 7'),
                subtitle: Text('Liked your post'),
                trailing: Icon(Icons.favorite),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  // Substitua a imagem abaixo pela imagem do remetente
                  backgroundImage: NetworkImage(
                      'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
                ),
                title: Text('User 8'),
                subtitle: Text('Liked your post'),
                trailing: Icon(Icons.favorite),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  // Substitua a imagem abaixo pela imagem do remetente
                  backgroundImage: NetworkImage(
                      'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
                ),
                title: Text('User 9'),
                subtitle: Text('Liked your post'),
                trailing: Icon(Icons.favorite),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  // Substitua a imagem abaixo pela imagem do remetente
                  backgroundImage: NetworkImage(
                      'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
                ),
                title: Text('User 10'),
                subtitle: Text('Liked your post'),
                trailing: Icon(Icons.favorite),
              ),
            ],
          ),
        ));
  }
}
