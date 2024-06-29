import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String brand;
  final AssetImage image;

  CartItem({
    required this.name,
    required this.brand,
    required this.image,
  });
}

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<CartItem> cartItems = [
    CartItem(
      name: 'VR Headset',
      brand: 'Oculus Quest 2',
      image: const AssetImage('assets/images/oculusQuest2.png'),
    ),
    CartItem(
      name: 'Fitness Tracker',
      brand: 'Fitbit Charge 5',
      image: const AssetImage('assets/images/FitbitCharge5.png'),
    ),
    CartItem(
      name: 'Graphics Card',
      brand: 'Nvidia GeForce RTX 3080',
      image: const AssetImage('assets/images/nvidiaGeforce.png'),
    ),
    CartItem(
      name: 'External Hard Drive',
      brand: 'Seagate Expansion 2TB',
      image: const AssetImage('assets/images/SeagateExpansion.png'),
    ),
    CartItem(
      name: 'Air Purifier',
      brand: 'Dyson Pure Cool TP04',
      image: const AssetImage('assets/images/dysonPurecool.png'),
    ),
  ];

  void _deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text('Click '),
                  Icon(Icons.close),
                  Text(' to remove item from Favourites'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return _buildCartItem(index);
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildCartItem(int index) {
    final item = cartItems[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2,
        child: ListTile(
          contentPadding: const EdgeInsets.all(10.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundImage: item.image,
              ),
            ),
          ),
          title: Text(
            item.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            '${item.brand},',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          trailing: GestureDetector(
            onTap: () => _deleteItem(index),
            child: const Icon(
              Icons.close,
              // color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
