import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // For JSON encoding and decoding
import 'ChatScreen.dart'; // Ensure you have the updated ChatScreen with SharedPreferences

class MessagesScreen extends StatelessWidget {
  Future<String?> loadLastMessage(String contactName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? messagesJson = prefs.getString(contactName);
    if (messagesJson != null && messagesJson.isNotEmpty) {
      List<dynamic> decodedMessages = jsonDecode(messagesJson);
      if (decodedMessages.isNotEmpty) {
        return decodedMessages.last['content'];
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        backgroundColor: const Color.fromARGB(255, 66, 67, 68),
      ),
      body: FutureBuilder(
        future: Future.wait([
          loadLastMessage('Antonio'),
          loadLastMessage('Ricardo'),
          loadLastMessage('Maria'),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          List<String?> lastMessages = snapshot.data as List<String?>;
          return ListView(
            children: [
              _buildContactTile(
                  context, 'Antonio', lastMessages[0] ?? "Hello my old friend!"),
              _buildContactTile(
                  context, 'Ricardo', lastMessages[1] ?? "Do you want to come by?"),
              _buildContactTile(
                  context, 'Maria', lastMessages[2] ?? "How are you doing?"),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContactTile(
      BuildContext context, String contactName, String lastMessage) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
                contactName: contactName, lastMessage: lastMessage),
          ),
        );
      },
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: const Color.fromARGB(255, 93, 89, 95),
        child: Text(
          contactName[0],
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(
        contactName,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
        size: 16,
      ),
    );
  }
}
