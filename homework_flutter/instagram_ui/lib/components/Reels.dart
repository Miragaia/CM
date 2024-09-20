import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Reels extends StatelessWidget {
  final String Name;
  final String comemets;
  final String image;

  Reels(this.Name, this.comemets, this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black, // Cor de fundo do vídeo ou imagem
            child: Center(
              child: Text(
                'Reels Content',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Cabeçalho (Texto "Reels", Ícones de Som e Câmera)
          Positioned(
            top: 30.0,
            left: 16.0,
            right: 16.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reels',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.volume_up,
                      color: Colors.white,
                      size: 28.0,
                    ),
                    SizedBox(width: 16.0),
                    Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 28.0,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Rodapé (Ícones de Like, Comentário, Três Pontos e Informações do Usuário)
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 28.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              '100', // Replace with the actual number of likes
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Column(
                          children: [
                            Icon(
                              Icons.mode_comment_outlined,
                              color: Colors.white,
                              size: 28.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              '50', // Replace with the actual number of comments
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Column(
                          children: [
                            Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 28.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              '20', // Replace with the actual number of shares
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      Name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 28.0,
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      comemets,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
