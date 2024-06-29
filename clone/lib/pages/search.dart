import 'dart:io';

import 'package:clone/utils/aboutus.dart';
import 'package:clone/utils/helpandsupport.dart';
import 'package:clone/utils/loginsignup.dart';
import 'package:clone/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../categories/categories.dart';
import 'package:clone/utils/productdetails.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  File? image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      } else {
        print('No image picked');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 34, 34, 34),
              ),
              child: Column(
                children: [
                  Text(
                    'ChromaCraft',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text('data'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Settings(),
                  ),
                );
              },
              child: ListTile(
                title: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Settings'),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.support_agent),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Help and Support'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpSupportPage(),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(),
                  ),
                );
              },
              child: ListTile(
                title: Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(
                      width: 10,
                    ),
                    Text('About Us'),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: ListTile(
                title: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 10,
                    ),
                    Text('LogOut'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _buildSearchBar(),
            _buildImageSlider(),
            _buildTrendingItemsSection('Trending items'),
            _buildTrendProductList(),
            _buildTrendingItemsSection('On Sale'),
            _buildOnSaleProductList(),
            _buildTrendingItemsSection('New Arrivals'),
            _buildNewProductList(),
            _buildTrendingItemsSection('Top Picks'),
            _buildTopProductList(),
            _buildTrendingItemsSection('Recommended for You'),
            _buildRecommendedProductList(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      backgroundColor: const Color(0xFFEDEDED),
      title: const Text(
        'Discover',
        style: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 18,
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Categories()),
              );
            },
            child: const Icon(Icons.grid_view, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      color: const Color(0xFFEDEDED),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.black),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
              ),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              onChanged: (value) {
                setState(() {
                  _isSearching = value.isNotEmpty;
                });
              },
            ),
          ),
          if (_isSearching)
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: CircularProgressIndicator(
                color: Color.fromARGB(31, 34, 34, 34),
              ),
            ),
          GestureDetector(
            onTap: () {
              getImage();
            },
            child: Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    List<String> imagePaths = [
      'assets/images/headphone.jpeg',
      'assets/images/nvidiaGeforce.png',
      'assets/images/ankerPowercore.png',
      'assets/images/dysonPurecool.png',
    ];

    return SizedBox(
      height: 300,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Image.asset(
            imagePaths[index],
            width: 480,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget _buildTrendingItemsSection(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Row(
            children: [
              Text(
                'View all',
                style: TextStyle(color: Colors.black),
              ),
              Icon(Icons.arrow_right, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedProductList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _ProductCard(
            context: context,
            name: 'Graphics Card',
            brand: 'Nvidia GeForce RTX 3080',
            price: 699.99,
            image: 'assets/images/nvidiaGeforce.png',
          ),
          _ProductCard(
            context: context,
            name: 'Desk Chair',
            brand: 'Herman Miller Aeron',
            price: 1399.99,
            image: 'assets/images/hermanMillerchair.png',
          ),
          _ProductCard(
            context: context,
            name: 'Smart Thermostat',
            brand: 'Google Nest Learning Thermostat',
            price: 249.99,
            image: 'assets/images/GoogleNestThermostat.png',
          ),
          _ProductCard(
            context: context,
            name: 'Wireless Mouse',
            brand: 'Logitech MX Master 3',
            price: 99.99,
            image: 'assets/images/logitechMxMaster3.png',
          ),
          _ProductCard(
            context: context,
            name: 'Coffee Maker',
            brand: 'Keurig K-Elite',
            price: 129.99,
            image: 'assets/images/keurigK-elite.png',
          ),
        ],
      ),
    );
  }

  Widget _buildTopProductList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _ProductCard(
            context: context,
            name: 'Smartphone',
            brand: 'iPhone 13',
            price: 999.99,
            image: 'assets/images/iphone13.png',
          ),
          _ProductCard(
            context: context,
            name: 'Smartwatch',
            brand: 'Apple Watch Series 8',
            price: 399.99,
            image: 'assets/images/appleWatchSeries8.png',
          ),
          _ProductCard(
            context: context,
            name: 'Laptop',
            brand: 'MacBook Pro 13"',
            price: 1299.99,
            image: 'assets/images/macbookPro13.png',
          ),
          _ProductCard(
            context: context,
            name: 'Smart Lock',
            brand: 'August Wi-Fi Smart Lock',
            price: 249.99,
            image: 'assets/images/augustSmartlock.png',
          ),
          _ProductCard(
            context: context,
            name: 'Bluetooth Speaker',
            brand: 'JBL Flip 5',
            price: 119.99,
            image: 'assets/images/jblFlip5.png',
          ),
        ],
      ),
    );
  }

  Widget _buildNewProductList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _ProductCard(
            context: context,
            name: 'Monitor',
            brand: 'LG UltraGear 27GL850-B',
            price: 449.99,
            image: 'assets/images/LGultragear.png',
          ),
          _ProductCard(
            context: context,
            name: 'External Hard Drive',
            brand: 'Seagate Expansion 2TB',
            price: 69.99,
            image: 'assets/images/SeagateExpansion.png',
          ),
          _ProductCard(
            context: context,
            name: 'Air Purifier',
            brand: 'Dyson Pure Cool TP04',
            price: 549.99,
            image: 'assets/images/dysonPurecool.png',
          ),
          _ProductCard(
            context: context,
            name: 'Wireless Controller',
            brand: 'Xbox Elite Series 2',
            price: 169.99,
            image: 'assets/images/xbox.png',
          ),
        ],
      ),
    );
  }

  Widget _buildOnSaleProductList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _ProductCard(
            context: context,
            name: 'Wireless Controller',
            brand: 'Xbox Elite Series 2',
            price: 169.99,
            image: 'assets/images/xbox.png',
          ),
          _ProductCard(
            context: context,
            name: 'Wireless Headphones',
            brand: 'Sony WH-1000XM4',
            price: 299.99,
            image: 'assets/images/sonyWH1000X.png',
          ),
          _ProductCard(
            context: context,
            name: 'Fitness Tracker',
            brand: 'Fitbit Charge 5',
            price: 179.99,
            image: 'assets/images/FitbitCharge5.png',
          ),
          _ProductCard(
            context: context,
            name: 'VR Headset',
            brand: 'Oculus Quest 2',
            price: 299.99,
            image: 'assets/images/oculusQuest2.png',
          ),
        ],
      ),
    );
  }

  Widget _buildTrendProductList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _ProductCard(
            context: context,
            name: 'VR Headset',
            brand: 'Oculus Quest 2',
            price: 299.99,
            image: 'assets/images/oculusQuest2.png',
          ),
          _ProductCard(
            context: context,
            name: 'Graphics Card',
            brand: 'Nvidia GeForce RTX 3080',
            price: 699.99,
            image: 'assets/images/nvidiaGeforce.png',
          ),
          _ProductCard(
            context: context,
            name: 'Desk Chair',
            brand: 'Herman Miller Aeron',
            price: 1399.99,
            image: 'assets/images/hermanMillerchair.png',
          ),
          _ProductCard(
            context: context,
            name: 'Portable Charger',
            brand: 'Anker PowerCore 10000',
            price: 29.99,
            image: 'assets/images/ankerPowercore.png',
          ),
          _ProductCard(
            context: context,
            name: 'Wireless Earbuds',
            brand: 'Apple AirPods Pro',
            price: 249.99,
            image: 'assets/images/appleAirpodsPro.png',
          ),
        ],
      ),
    );
  }
}

Widget _ProductCard({
  required BuildContext context, // Add BuildContext parameter
  required String name,
  required String brand,
  required double price,
  required String image,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailsPage(
            name: name,
            brand: brand,
            price: price,
            image: image,
          ),
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.all(10.0),
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  brand,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$$price',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 14,
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
