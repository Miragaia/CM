import 'package:flutter/material.dart';

class FriendRequestsScreen extends StatefulWidget {
  @override
  _FriendRequestsScreenState createState() => _FriendRequestsScreenState();
}

class _FriendRequestsScreenState extends State<FriendRequestsScreen> {
  // List to hold friend requests
  List<Map<String, dynamic>> friendRequests = [
    {'name': 'User 1', 'status': 'pending'},
    {'name': 'User 2', 'status': 'pending'},
    {'name': 'User 3', 'status': 'pending'},
    {'name': 'User 4', 'status': 'pending'},
    {'name': 'User 5', 'status': 'pending'},
  ];

  // List to hold suggested friends
  List<Map<String, dynamic>> suggestions = [
    {'name': 'User 15'},
    {'name': 'User 6'},
    {'name': 'User 7'},
    {'name': 'User 8'},
  ];

  // Accept friend request
  void acceptRequest(int index) {
    setState(() {
      friendRequests[index]['status'] = 'accepted';
    });
  }

  // Deny friend request
  void denyRequest(int index) {
    setState(() {
      friendRequests.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friend Requests'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onHorizontalDragUpdate: (details) {
          if (details.primaryDelta! > 0) {
            Navigator.pop(context);
          }
        },
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Friend Requests'),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            // Friend requests list
            ...friendRequests.map((request) {
              int index = friendRequests.indexOf(request);
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                      'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
                ),
                title: Text(request['name']),
                subtitle: Text(
                    request['status'] == 'pending' ? 'Wants to follow you' : 'Request accepted'),
                trailing: request['status'] == 'pending'
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              acceptRequest(index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              denyRequest(index);
                            },
                          ),
                        ],
                      )
                    : null,
              );
            }).toList(),

            // Suggestions section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Suggestions For You'),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            ...suggestions.map((suggestion) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                      'https://www.pngkey.com/png/full/114-1149878_notification-icon-png.png'),
                ),
                title: Text(suggestion['name']),
                subtitle: Text('Suggested for you'),
                trailing: TextButton(
                  onPressed: () {
                    // Handle follow suggestion logic here
                  },
                  child: Text('Follow'),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
