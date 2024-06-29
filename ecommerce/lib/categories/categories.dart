import 'package:flutter/material.dart';
import 'product_list_page.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  final List<String> _categories = [
    'Smartphones & Accessories',
    'Laptops & Computers',
    'Tablets & E-Readers',
    'Cameras & Photography',
    'Televisions & Home Theater',
    'Headphones & Earbuds',
    'Wearable Technology',
    'Smart Home Devices',
    'Gaming Consoles & Accessories',
    'Drones & Action Cameras',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: ExploreGrid(
              names: _categories,
              onTap: (index) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductListPage(
                      categoryName: _categories[index],
                      categoryIndex: index,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
        ],
      ),
    );
  }
}

class ExploreGrid extends StatelessWidget {
  final List<String> names;
  final Function(int) onTap;

  const ExploreGrid({required this.names, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: names.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 7.5,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(7.5),
          child: GestureDetector(
            onTap: () => onTap(index),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 7.5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/${names[index]}.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 7.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.5),
                        const Color.fromARGB(193, 0, 0, 0).withOpacity(0.01),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Text(
                    names[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
