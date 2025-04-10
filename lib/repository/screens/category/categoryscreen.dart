import 'package:flutter/material.dart';
import "../category/productpage.dart";
import 'package:skly_flash/repository/app_header.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController searchController = TextEditingController();
  String selectedCategory = 'All';
  String searchQuery = '';

  // Color palette
  final Color primaryColor = Color(0xFF009085);       // Teal
  final Color secondaryColor = Color(0xFF2F4858);     // Dark blue
  final Color accentColor = Color(0xFFF6C445);        // Yellow
  final Color darkAccent = Color(0xFF006B7C);         // Dark teal
  final Color lightAccent = Color(0xFFFDD90D);        // Light yellow

  // Categories for the top navigation bar
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.all_inclusive, 'label': 'All'},
    {'icon': Icons.kitchen, 'label': 'Grocery & Kitchen'},
    {'icon': Icons.local_dining, 'label': 'Snacks & Drinks'},
    {'icon': Icons.spa, 'label': 'Beauty & Personal Care'},
    {'icon': Icons.devices, 'label': 'Electronics & Accessories'},
  ];

  // Sub-categories data
  final Map<String, List<Map<String, String>>> categoryData = {
    'Grocery & Kitchen': [
      {"name": "Fruits & Vegetables", "img": "assets/images/image 41.png"},
      {"name": "Dairy, Bread & Eggs", "img": "assets/images/dairy_category.jpeg"},
      {"name": "Atta, Rice, Oil & Dals", "img": "assets/images/image 43.png"},
      {"name": "Meat, Fish & Eggs", "img": "assets/images/meat_fish.jpeg"},
      {"name": "Masala & Dry Fruits", "img": "assets/images/masalas.jpeg"},
    ],
    'Snacks & Drinks': [
      {"name": "Tea, Coffee & More", "img": "assets/images/tea_coffee.jpeg"},
      {"name": "Packaged Food", "img": "assets/images/packed_food.jpeg"},
      {"name": "Ice Creams & More", "img": "assets/images/image 24.png"},
      {"name": "Frozen Food", "img": "assets/images/frozen_foods.jpeg"},
      {"name": "Sweet Cravings", "img": "assets/images/image 32.png"},
      {"name": "Cold Drinks & Juices", "img": "assets/images/fruit_juices.jpeg"},
      {"name": "Munchies", "img": "assets/images/image 31.png"},
      {"name": "Biscuits & Cookies", "img": "assets/images/biscuits.jpeg"},
    ],
    'Beauty & Personal Care': [
      {"name": "Skincare", "img": "assets/images/skincare.jpeg"},
      {"name": "Haircare", "img": "assets/images/haircare.jpeg"},
      {"name": "Makeup", "img": "assets/images/makeup.jpeg"},
      {"name": "Personal Care", "img": "assets/images/persnal_care.jpeg"},
      {"name": "Perfumes", "img": "assets/images/perfumes.jpeg"},
    ],
    'Electronics & Accessories': [
      {"name": "Headphones", "img": "assets/images/Wired_Earphones.jpg"},
      {"name": "Lights & electricals", "img": "assets/images/Lights.jpg"},
      {"name": "Battery", "img": "assets/images/batteries.png"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with Search Bar
          AppHeader(searchController: searchController),

          // Category Navigation Bar
          _buildCategoryNavBar(),

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildCategorySection("Grocery & Kitchen"),
                  _buildCategorySection("Snacks & Drinks"),
                  _buildCategorySection("Beauty & Personal Care"),
                  _buildCategorySection("Electronics & Accessories"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryNavBar() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedCategory == categories[index]['label'];
          return Container(
            margin: EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = categories[index]['label'];
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? primaryColor.withOpacity(0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? primaryColor : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected ? primaryColor : Colors.grey[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        categories[index]['icon'],
                        color: isSelected ? Colors.white : Colors.grey[700],
                        size: 20,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      categories[index]['label'],
                      style: TextStyle(
                        color: isSelected ? primaryColor : Colors.grey[700],
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategorySection(String title) {
    if (!categoryData.containsKey(title)) return SizedBox();

    if (selectedCategory != 'All' && selectedCategory != title) {
      return SizedBox();
    }

    final filteredItems = categoryData[title]!.where((item) {
      return item['name']!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    if (filteredItems.isEmpty) return SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              color: secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: filteredItems.length,
          itemBuilder: (context, index) {
            final item = filteredItems[index];
            return GestureDetector(
              onTap: () {
                _navigateToProducts(item['name']!);
              },
              child: Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: item['img'] != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item['img']!,
                        fit: BoxFit.cover,
                      ),
                    )
                        : Icon(Icons.category, color: primaryColor, size: 40),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item['name']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  void _navigateToProducts(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductsPage(
          category: category,
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
          accentColor: accentColor,
          darkAccent: darkAccent,
          lightAccent: lightAccent,
        ),
      ),
    );
  }
}