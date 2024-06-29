import 'package:flutter/material.dart';

class InviteFriendPage extends StatelessWidget {
  const InviteFriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invite a Friend'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Invite a Friend',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Share your referral link with your friends to earn rewards when they sign up!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to share referral link
              },
              child: const Text('Share Referral Link'),
            ),
          ],
        ),
      ),
    );
  }
}
