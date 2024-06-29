import 'package:clone/utils/loginsignup.dart';
import 'package:clone/settings/accountsettings.dart';
import 'package:clone/settings/coupons.dart';
import 'package:clone/settings/deleteaccount.dart';
import 'package:clone/settings/feedback.dart';
import 'package:clone/settings/notification.dart';
import 'package:clone/settings/reportbug.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('GENERAL'),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      buildSettingOption(
                        icon: Icons.person_outline,
                        title: 'Account',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AccountSettingsPage(),
                            ),
                          );
                        },
                      ),
                      buildSettingOption(
                        icon: Icons.notifications,
                        title: 'Notifications',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationPage(),
                            ),
                          );
                        },
                      ),
                      buildSettingOption(
                        icon: Icons.card_giftcard,
                        title: 'Coupons',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CouponsPage(),
                            ),
                          );
                        },
                      ),
                      buildSettingOption(
                        icon: Icons.exit_to_app,
                        title: 'Logout',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                      ),
                      buildSettingOption(
                        icon: Icons.delete_forever,
                        title: 'Delete Account',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeleteAccountPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text('FEEDBACK'),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      buildSettingOption(
                        icon: Icons.warning,
                        title: 'Report a bug',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportBugPage(),
                            ),
                          );
                        },
                      ),
                      buildSettingOption(
                        icon: Icons.send,
                        title: 'Send feedback',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FeedbackPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
