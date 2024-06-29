import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Notification Title $index'),
            subtitle: Text('This is the notification message.'),
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(169, 146, 146, 146),
              child: Icon(Icons.notifications),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
