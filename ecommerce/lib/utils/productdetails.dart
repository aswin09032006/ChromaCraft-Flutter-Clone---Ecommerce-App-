import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final String name;
  final String brand;
  final double price;
  final String image;

  const ProductDetailsPage({
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
  });

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: widget.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' (by ${widget.brand})',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _toggleFavorite,
                        child: Icon(
                          _isFavorited
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: _isFavorited ? Colors.red : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '\$${widget.price}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quantity:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: decrementQuantity,
                        icon: Icon(Icons.remove),
                      ),
                      Text(
                        '$quantity',
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: incrementQuantity,
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Average Rating:     4/5',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: const Color.fromARGB(255, 255, 209, 59),
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: const Color.fromARGB(255, 255, 209, 59),
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: const Color.fromARGB(255, 255, 209, 59),
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: const Color.fromARGB(255, 255, 209, 59),
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(81, 214, 214, 214),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(
                              Icons.payment,
                              color: Colors.green,
                            ),
                            title: Text('Flexible ways to pay.'),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(
                              Icons.card_giftcard_sharp,
                              color: Colors.red,
                            ),
                            title: Text('Plus No Cost EMI§ available.'),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(
                              Icons.local_shipping,
                              color: Colors.blue,
                            ),
                            title: Text('Free delivery and pickup.'),
                            subtitle: Text(
                                'Get free delivery or pick up at your ChromaCraft Store.'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {},
                      child: Text('Add to Cart'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        side: BorderSide(color: Colors.black),
                      ),
                      onPressed: () {},
                      child: Text('Buy Now'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
