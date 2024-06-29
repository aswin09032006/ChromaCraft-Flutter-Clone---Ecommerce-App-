import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  _launchInstaProfile() async {
    final url1 = 'https://www.instagram.com/aswxn._03/';
    if (await canLaunch(url1)) {
      await launch(url1);
    } else {
      throw 'Could not launch $url1';
    }
  }

  _launchLinkedinProfile() async {
    final url2 = 'https://www.linkedin.com/in/vkaswin/';
    if (await canLaunch(url2)) {
      await launch(url2);
    } else {
      throw 'Could not launch $url2';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ChromaCraft : World of Electronics',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Version: 1.0.0',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Developer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'ChromaCraft',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'ChromaCraft is your one-stop destination for the latest electronic appliances and gadgets. We offer a wide range of products, from smartphones and laptops to home appliances and accessories. Our platform provides a seamless shopping experience, with secure transactions and reliable customer support.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Acknowledgments',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Special thanks to our customers for their continued support and feedback. We would also like to acknowledge the contributions of our development team and partners.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Follow us on',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        _launchInstaProfile();
                      },
                      child: Image.asset(
                        'assets/images/instagram.png',
                        height: 50,
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        _launchLinkedinProfile();
                      },
                      child: Image.asset(
                        'assets/images/Linkedin.png',
                        height: 50,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
