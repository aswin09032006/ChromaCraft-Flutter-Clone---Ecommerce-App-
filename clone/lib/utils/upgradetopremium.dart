import 'package:flutter/material.dart';

class UpgradeToPremiumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upgrade to Premium'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Premium Features',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Unlock exclusive features and benefits with Premium membership:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.check),
                    title: Text('1 Day Delivery'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check),
                    title: Text('Access to premium products'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check),
                    title: Text('Priority customer support'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromARGB(255, 0, 0, 0)),
                    foregroundColor: WidgetStatePropertyAll(
                        const Color.fromARGB(255, 255, 255, 255))),
                onPressed: () {},
                child: Text('Upgrade Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
