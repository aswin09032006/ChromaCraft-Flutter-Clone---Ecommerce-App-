import 'package:flutter/material.dart';

class Orderplaced extends StatefulWidget {
  const Orderplaced({super.key});

  @override
  State<Orderplaced> createState() => _OrderplacedState();
}

class _OrderplacedState extends State<Orderplaced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.verified,
              color: Colors.green,
              size: 70,
            ),
            Text(
              'Order Placed',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Thanks for ordering through our app'),
          ],
        ),
      ),
    );
  }
}
