import 'package:clone/utils/orderplaced.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String brand;
  final double price;
  final AssetImage image;

  CartItem({
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
  });
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(
      name: 'Wireless Headphones',
      brand: 'Sony',
      price: 299.99,
      image: const AssetImage('assets/images/headphone.jpeg'),
    ),
    CartItem(
      name: 'Smartwatch',
      brand: 'Apple Watch Series 8',
      price: 399.99,
      image: const AssetImage('assets/images/appleWatchSeries8.png'),
    ),
  ];

  void _deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  double get _totalPrice {
    return cartItems.fold(0.0, (sum, item) => sum + item.price);
  }

  double _deliveryFee = 0.0; // Example delivery fee
  double _taxFee = 25.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.shopping_cart),
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
                Icon(Icons.delete),
                Text(' to remove item from the Cart'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return _buildCartItem(index);
                },
              ),
            ),
            _buildTotalRow("Sub-total:", _totalPrice),
            _buildTotalRow("Delivery:", _deliveryFee),
            _buildTotalRow("Tax fee:", _taxFee),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.00),
                color: const Color.fromARGB(255, 172, 172, 172),
              ),
              child: _buildTotalRow(
                  "Total:", _totalPrice + _deliveryFee + _taxFee),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromARGB(192, 0, 0, 0))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Orderplaced(),
                    ),
                  );
                },
                child: const Text(
                  'PROCEED TO CHECKOUT',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(int index) {
    final item = cartItems[index];
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: item.image,
      ),
      title: Text(item.name),
      subtitle: Text(item.brand),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => _deleteItem(index),
            child: const Icon(Icons.delete),
          ),
          Text('\$${item.price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String title, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text('\$${value.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
