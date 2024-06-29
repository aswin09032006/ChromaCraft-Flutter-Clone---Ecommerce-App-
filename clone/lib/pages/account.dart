import 'dart:convert';
import 'package:clone/utils/helpandsupport.dart';
import 'package:clone/utils/inviteafriend.dart';
import 'package:clone/utils/loginsignup.dart';
import 'package:clone/utils/privacypolicy.dart';
import 'package:clone/utils/purchasehistory.dart';
import 'package:clone/settings/settings.dart';
import 'package:clone/utils/upgradetopremium.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    fetchUrl();
  }

  Future<void> fetchUrl() async {
    var response = await http.get(Uri.parse("https://reqres.in/api/users/3"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        userData = data['data'] ?? {};
        print(userData.isNotEmpty ? userData['email'] : 'No user data found');
      });
    } else {
      print('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                userData['avatar'] ??
                    '', // Using 'avatar' from userData if available
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${userData['first_name'] ?? ''} ${userData['last_name'] ?? ''}', // Accessing first_name and last_name from userData
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              userData['email'] ?? '',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromARGB(255, 255, 177, 59)),
                      foregroundColor:
                          const WidgetStatePropertyAll(Colors.black)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpgradeToPremiumPage(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.workspace_premium),
                      Text('Upgrade to Premium'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(31, 34, 34, 34),
                  ),
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PrivacyPolicyPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.privacy_tip),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Privacy'),
                            ],
                          ),
                        ),
                        Row(
                          children: [Icon(Icons.chevron_right)],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(31, 34, 34, 34),
                  ),
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Purchasehistory(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.history),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Purchase History'),
                            ],
                          ),
                        ),
                        Row(
                          children: [Icon(Icons.chevron_right)],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(31, 34, 34, 34),
                  ),
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HelpSupportPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.help),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Help & Support'),
                            ],
                          ),
                        ),
                        Row(
                          children: [Icon(Icons.chevron_right)],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(31, 34, 34, 34),
                  ),
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Settings(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.settings),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Settings'),
                            ],
                          ),
                        ),
                        Row(
                          children: [Icon(Icons.chevron_right)],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(31, 34, 34, 34),
                  ),
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InviteFriendPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.person_add),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Invite a Friend'),
                            ],
                          ),
                        ),
                        Row(
                          children: [Icon(Icons.chevron_right)],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the value to control the roundness
                    color: const Color.fromARGB(31, 34, 34, 34),
                  ),
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.logout),
                          SizedBox(
                            width: 15,
                          ),
                          Text('Logout'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
