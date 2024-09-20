import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_ui/pages/UserMap.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              SizedBox(width: 10),
              Text('@miragaia', style: TextStyle(color: Colors.black)),
              Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add_box_outlined),
              onPressed: () {},
            ),
            PopupMenuButton(
              icon: Icon(Icons.menu), // Ícone personalizado para o botão
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: 'configuracoes',
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 8.0),
                      Text('Settings and Privacy'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'atividade',
                  child: Row(
                    children: [
                      Icon(Icons.auto_graph_rounded),
                      SizedBox(width: 8.0),
                      Text('Your Activity'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'arquivo',
                  child: Row(
                    children: [
                      Icon(Icons.archive),
                      SizedBox(width: 8.0),
                      Text('Archive'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'qrcode',
                  child: Row(
                    children: [
                      Icon(Icons.qr_code),
                      SizedBox(width: 8.0),
                      Text('QR Code'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'salvo',
                  child: Row(
                    children: [
                      Icon(Icons.bookmark_border),
                      SizedBox(width: 8.0),
                      Text('Saved'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'supervisao',
                  child: Row(
                    children: [
                      Icon(Icons.supervised_user_circle),
                      SizedBox(width: 8.0),
                      Text('Close Friends'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'encomendasepagamentos',
                  child: Row(
                    children: [
                      Icon(Icons.family_restroom_rounded),
                      SizedBox(width: 8.0),
                      Text('Supervision'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'verificacaometa',
                  child: Row(
                    children: [
                      Icon(Icons.verified),
                      SizedBox(width: 8.0),
                      Text('Verified'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'supervisao',
                  child: Row(
                    children: [
                      Icon(Icons.supervised_user_circle),
                      SizedBox(width: 8.0),
                      Text('Close Friends'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'sair',
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8.0),
                      Text('Logout'),
                    ],
                  ),
                  // ao clicar vai para a tela de login
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
              onSelected: (value) {},
            ),
          ],
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/50dab922-5d48-4c6b-8725-7fd0755d9334/3a3f2d35-8167-4708-9ef0-bdaa980989f9.png'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text('10', style: TextStyle(fontSize: 20)),
                    Text('Posts'),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text('100', style: TextStyle(fontSize: 20)),
                    Text('Followers'),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text('200', style: TextStyle(fontSize: 20)),
                    Text('Following'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
                'Welcome to my instagram clone profile' +
                    ' - Miguel Miragaia',),
          ),
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationPage()),
              );
            },
          ),


          // Add butons profile instagram to edit profile, share, and discover persons
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                SizedBox(width: 2),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(BorderSide(
                          color: Colors.black)), // Definir borda preta
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Text('Edit', style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(width: 2),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(BorderSide(
                          color: Colors.black)), // Definir borda preta
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Text('Share', style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(width: 2),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(BorderSide(
                        color: Colors.black,
                      )), // Definir borda preta
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Icon(Icons.person_add, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),

          // add a text - "Stories Highlights" com uma stea para baixo para ver mais e ao clicar abre o que eu colcoar a seguir

          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[300]),
                      child: Icon(Icons.add, color: Colors.black),
                    ),
                    Text('New'),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[400]),
                    ),
                    Text('Portugal'),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[400]),
                    ),
                    Text('Friends'),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[400]),
                    ),
                    Text('Benfica'),
                  ],
                ),
              ],
            ),
          ),

          // add a line to separate the stories from the posts
          Divider(
            color: Colors.black,
            thickness: 0.5,
          ),

          // create 3 buttons with icons posts, igtv and tagged, with not text, atraves de tabbar
          DefaultTabController(
            length: 3,
            child: Column(
              children: [
                // Parte superior da tela com as abas
                TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.grid_on)),
                    Tab(icon: Icon(Icons.live_tv)),
                    Tab(icon: Icon(Icons.person_pin)),
                  ],
                ),

                // Parte inferior da tela com as visualizações de cada aba
                Container(
                  height: 500,
                  child: TabBarView(
                    children: [
                      // Grade de imagens para a primeira aba
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(10, (index) {
                          return Container(
                            height: 100,
                            width: 100,
                            color: const Color.fromARGB(255, 164, 156, 154),
                            margin: EdgeInsets.all(4),
                          );
                        }),
                      ),

                      // list de vídeos estilo "reels" para a segunda aba (retângulos), com 3X3 vídeos quero altura maior que largura
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(9, (index) {
                          return Container(
                            height: 100,
                            width: 100,
                            color: const Color.fromARGB(255, 165, 181, 146),
                            margin: EdgeInsets.all(4),
                          );
                        }),
                      ),

                      // Grade de imagens para a terceira aba
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(7, (index) {
                          return Container(
                            height: 100,
                            width: 100,
                            color: const Color.fromARGB(255, 159, 183, 194),
                            margin: EdgeInsets.all(4),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Ação ao clicar no botão de login
                // Verificar as credenciais e fazer login
                // Se as credenciais estiverem corretas, navegue para a tela de perfil
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfile()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
