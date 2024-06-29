import 'package:clone/utils/loginsignup.dart';
import 'package:clone/settings/changepassword.dart';
import 'package:clone/settings/editprofile.dart';
import 'package:clone/settings/notificationsettings.dart';
import 'package:flutter/material.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Edit Profile'),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Editprofile()));
            },
          ),
          ListTile(
            title: Text('Change Password'),
            leading: Icon(Icons.lock),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangePasswordPage()));
            },
          ),
          ListTile(
            title: Text('Notification Settings'),
            leading: Icon(Icons.notifications),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationSettingsPage()));
            },
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
