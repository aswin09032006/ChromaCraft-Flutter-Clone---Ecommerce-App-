import 'package:clone/utils/productdetails.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  final int categoryIndex;
  final String categoryName;

  const ProductListPage({
    Key? key,
    required this.categoryIndex,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: _buildProductList(),
      ),
    );
  }

  Widget _buildProductList() {
    List<Widget> productList;
    switch (categoryIndex) {
      case 0:
        productList = _buildSmartphoneAccessoriesProductList();
        break;
      case 1:
        productList = _buildLaptopsComputersProductList();
        break;
      case 2:
        productList = _buildTabletsEreadersProductList();
        break;
      case 3:
        productList = _buildCamerasPhotographyProductList();
        break;
      case 4:
        productList = _buildTelevisionsHometheaterProductList();
        break;
      case 5:
        productList = _buildHeadphoneEarbudsProductList();
        break;
      case 6:
        productList = _buildWearableTechnologyProductList();
        break;
      case 7:
        productList = _buildSmarthomedevicesProductList();
        break;
      case 8:
        productList = _buildGamingconsolesProductList();
        break;
      case 9:
        productList = _buildDronesActioncamerasProductList();
        break;
      default:
        productList = [];
    }
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: productList,
    );
  }

  List<Widget> _buildSmartphoneAccessoriesProductList() {
    return [
      _ProductCard(
        name: 'Wireless Controller',
        brand: 'Xbox Elite Series 2',
        price: 169.99,
        image: 'assets/images/xbox.png',
      ),
      _ProductCard(
        name: 'Wireless Headphones',
        brand: 'Sony WH-1000XM4',
        price: 299.99,
        image: 'assets/images/sonyWH1000X.png',
      ),
      _ProductCard(
        name: 'Fitness Tracker',
        brand: 'Fitbit Charge 5',
        price: 179.99,
        image: 'assets/images/FitbitCharge5.png',
      ),
      _ProductCard(
        name: 'VR Headset',
        brand: 'Oculus Quest 2',
        price: 299.99,
        image: 'assets/images/oculusQuest2.png',
      ),
    ];
  }

  List<Widget> _buildLaptopsComputersProductList() {
    return [
      _ProductCard(
        name: 'Gaming Laptop',
        brand: 'Alienware m15 R4',
        price: 1999.99,
        image: 'assets/images/alienware m15 r4.png',
      ),
      _ProductCard(
        name: 'Ultrabook',
        brand: 'Dell XPS 13',
        price: 1499.99,
        image: 'assets/images/dell xps 13.png',
      ),
      _ProductCard(
        name: 'Desktop Computer',
        brand: 'iMac 27-inch',
        price: 1799.99,
        image: 'assets/images/imac 27 inch.png',
      ),
      _ProductCard(
        name: '2-in-1 Laptop',
        brand: 'HP Spectre x360',
        price: 1299.99,
        image: 'assets/images/hp spectre x360.png',
      ),
    ];
  }

  List<Widget> _buildTabletsEreadersProductList() {
    return [
      _ProductCard(
        name: 'Tablet',
        brand: 'iPad Pro',
        price: 999.99,
        image: 'assets/images/ipad pro.png',
      ),
      _ProductCard(
        name: 'E-Reader',
        brand: 'Kindle Paperwhite',
        price: 129.99,
        image: 'assets/images/kindle paperwhite.png',
      ),
      _ProductCard(
        name: 'Android Tablet',
        brand: 'Samsung Galaxy Tab S7',
        price: 649.99,
        image: 'assets/images/samsung galaxy tab s7.png',
      ),
      _ProductCard(
        name: 'E-Reader',
        brand: 'Kobo Clara HD',
        price: 119.99,
        image: 'assets/images/kobo clara hd.png',
      ),
    ];
  }

  List<Widget> _buildCamerasPhotographyProductList() {
    return [
      _ProductCard(
        name: 'DSLR Camera',
        brand: 'Canon EOS 5D',
        price: 2499.99,
        image: 'assets/images/canon eos 5d.png',
      ),
      _ProductCard(
        name: 'Mirrorless Camera',
        brand: 'Sony Alpha a7 III',
        price: 1999.99,
        image: 'assets/images/sony alpha a7.png',
      ),
      _ProductCard(
        name: 'Action Camera',
        brand: 'GoPro HERO9',
        price: 399.99,
        image: 'assets/images/gopro hero9.png',
      ),
      _ProductCard(
        name: 'Compact Camera',
        brand: 'Fujifilm X100V',
        price: 1399.99,
        image: 'assets/images/fujifilm x100v.png',
      ),
    ];
  }

  List<Widget> _buildTelevisionsHometheaterProductList() {
    return [
      _ProductCard(
        name: '4K TV',
        brand: 'Samsung QLED',
        price: 1299.99,
        image: 'assets/images/samsung qled.png',
      ),
      _ProductCard(
        name: 'OLED TV',
        brand: 'LG CX',
        price: 1499.99,
        image: 'assets/images/lg cx.png',
      ),
      _ProductCard(
        name: 'Soundbar',
        brand: 'Bose Soundbar 700',
        price: 799.99,
        image: 'assets/images/bose soundbar 700.png',
      ),
      _ProductCard(
        name: 'Home Theater System',
        brand: 'Sony HT-S350',
        price: 299.99,
        image: 'assets/images/sony ht-s350.png',
      ),
    ];
  }

  List<Widget> _buildHeadphoneEarbudsProductList() {
    return [
      _ProductCard(
        name: 'Wireless Earbuds',
        brand: 'Apple AirPods Pro',
        price: 249.99,
        image: 'assets/images/appleAirpodsPro.png',
      ),
      _ProductCard(
        name: 'Over-Ear Headphones',
        brand: 'Bose 700',
        price: 379.99,
        image: 'assets/images/bose 700.png',
      ),
      _ProductCard(
        name: 'Gaming Headset',
        brand: 'SteelSeries Arctis Pro',
        price: 179.99,
        image: 'assets/images/steelseries arctis pro.png',
      ),
      _ProductCard(
        name: 'Noise Cancelling Headphones',
        brand: 'Sony WH-1000XM4',
        price: 349.99,
        image: 'assets/images/sony wh1000xm4.png',
      ),
    ];
  }

  List<Widget> _buildWearableTechnologyProductList() {
    return [
      _ProductCard(
        name: 'Smartwatch',
        brand: 'Apple Watch Series 6',
        price: 399.99,
        image: 'assets/images/appleWatchSeries8.png',
      ),
      _ProductCard(
        name: 'Fitness Tracker',
        brand: 'Fitbit Charge 5',
        price: 179.99,
        image: 'assets/images/FitbitCharge5.png',
      ),
      _ProductCard(
        name: 'Smart Glasses',
        brand: 'Google Glass',
        price: 999.99,
        image: 'assets/images/google glass.png',
      ),
      _ProductCard(
        name: 'SmartRing',
        brand: 'Oura Ring',
        price: 299.99,
        image: 'assets/images/oura ring.png',
      ),
    ];
  }

  List<Widget> _buildSmarthomedevicesProductList() {
    return [
      _ProductCard(
        name: 'Smart Speaker',
        brand: 'Amazon Echo',
        price: 99.99,
        image: 'assets/images/amazon echo.png',
      ),
      _ProductCard(
        name: 'Smart Light Bulb',
        brand: 'Philips Hue',
        price: 49.99,
        image: 'assets/images/philips hue.png',
      ),
      _ProductCard(
        name: 'Smart Thermostat',
        brand: 'Nest Thermostat',
        price: 249.99,
        image: 'assets/images/nest thermostat.png',
      ),
      _ProductCard(
        name: 'Smart Lock',
        brand: 'August Smart Lock',
        price: 229.99,
        image: 'assets/images/augustSmartlock.png',
      ),
    ];
  }

  List<Widget> _buildGamingconsolesProductList() {
    return [
      _ProductCard(
        name: 'Gaming Console',
        brand: 'PlayStation 5',
        price: 499.99,
        image: 'assets/images/ps5.png',
      ),
      _ProductCard(
        name: 'Gaming Console',
        brand: 'Xbox Series X',
        price: 499.99,
        image: 'assets/images/xbox.png',
      ),
      _ProductCard(
        name: 'Handheld Console',
        brand: 'Nintendo Switch',
        price: 299.99,
        image: 'assets/images/nintendo switch.png',
      ),
      _ProductCard(
        name: 'VR Headset',
        brand: 'Oculus Quest 2',
        price: 299.99,
        image: 'assets/images/oculusQuest2.png',
      ),
    ];
  }

  List<Widget> _buildDronesActioncamerasProductList() {
    return [
      _ProductCard(
        name: 'Drone',
        brand: 'DJI Mavic Air 2',
        price: 799.99,
        image: 'assets/images/dji mavic air 2.png',
      ),
      _ProductCard(
        name: 'Action Camera',
        brand: 'GoPro HERO9',
        price: 399.99,
        image: 'assets/images/gopro hero9.png',
      ),
      _ProductCard(
        name: 'Drone',
        brand: 'Parrot Anafi',
        price: 699.99,
        image: 'assets/images/parrot anafi.png',
      ),
      _ProductCard(
        name: 'Action Camera',
        brand: 'DJI Osmo Action',
        price: 299.99,
        image: 'assets/images/dji osmo action.png',
      ),
    ];
  }
}

class _ProductCard extends StatelessWidget {
  final String name;
  final String brand;
  final double price;
  final String image;

  const _ProductCard({
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        width: double.infinity,
        height: 180, // Increased height of the container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    brand,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
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
