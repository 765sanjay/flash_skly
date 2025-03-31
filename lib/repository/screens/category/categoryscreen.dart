import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController searchController = TextEditingController();

  // Color palette
  final Color primaryColor = Color(0xFF009085);
  final Color secondaryColor = Color(0xFF2F4858);
  final Color accentColor = Color(0xFFF6C445);
  final Color darkAccent = Color(0xFF006B7C);
  final Color lightAccent = Color(0xFFFDD90D);

  // Categories data with proper asset paths
  final List<Map<String, dynamic>> grocerykitchen = [
    {"img": "assets/images/image 41.png", "text": "Vegetables & \nFruits"},
    {"img": "assets/images/image 42.png", "text": "Atta, Dal & \nRice"},
    {"img": "assets/images/image 43.png", "text": "Oil, Ghee & \nMasala"},
    {"img": "assets/images/image 44.png", "text": "Dairy, Bread & \nMilk"},
    {"img": "assets/images/image 45.png", "text": "Biscuits & \nBakery"}
  ];

  final List<Map<String, dynamic>> secondgrocery = [
    {"img": "assets/images/image 21.png", "text": "Dry Fruits &\n Cereals"},
    {"img": "assets/images/image 22.png", "text": "Kitchen &\n Appliances"},
    {"img": "assets/images/image 23.png", "text": "Tea & \nCoffees"},
    {"img": "assets/images/image 24.png", "text": "Ice Creams & \nmuch more"},
    {"img": "assets/images/image 25.png", "text": "Noodles & \nPacket Food"}
  ];

  final List<Map<String, dynamic>> snacksanddrinks = [
    {"img": "assets/images/image 31.png", "text": "Chips &\n Namkeens"},
    {"img": "assets/images/image 32.png", "text": "Sweets & \nChocolates"},
    {"img": "assets/images/image 33.png", "text": "Drinks & \nJuices"},
    {"img": "assets/images/image 34.png", "text": "Sauces &\n Spreads"},
    {"img": "assets/images/image 35.png", "text": "Beauty &\n Cosmetics"}
  ];

  final List<Map<String, dynamic>> household = [
    {"img": "assets/images/image 36.png", "text": "Cleaning \nSupplies"},
    {"img": "assets/images/image 37.png", "text": "Laundry &\n Supplies"},
    {"img": "assets/images/image 38.png", "text": "Home \nCare"},
    {"img": "assets/images/image 39.png", "text": "Stationery &\n Office"},
    {"img": "assets/images/image 40.png", "text": "Pet \nCare"}
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 60) / 4;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            _buildHeader(),

            // Categories Sections
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategorySection("Grocery & Kitchen", grocerykitchen, itemWidth),
                  _buildCategorySection("Pantry Essentials", secondgrocery, itemWidth),
                  _buildCategorySection("Snacks & Drinks", snacksanddrinks, itemWidth),
                  _buildCategorySection("Household Essentials", household, itemWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor, darkAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SKLY Flash",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: lightAccent,
                child: Icon(
                  Icons.person,
                  color: secondaryColor,
                  size: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "8 minutes delivery",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on, color: lightAccent, size: 16),
              SizedBox(width: 4),
              Flexible(
                child: Text(
                  "HOME - Sujal Dave, Ratanada, Jodhpur (Raj)",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search for products...",
                prefixIcon: Icon(Icons.search, color: secondaryColor),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(String title, List<Map<String, dynamic>> items, double itemWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final imagePath = items[index]["img"];
              final imageName = imagePath.split('/').last;

              return Container(
                width: itemWidth,
                margin: EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    Container(
                      width: itemWidth,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          imagePath,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            debugPrint('Failed to load image: $imagePath');
                            debugPrint('Error: $error');
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.error, color: Colors.red, size: 24),
                                SizedBox(height: 4),
                                Text(
                                  imageName,
                                  style: TextStyle(fontSize: 8),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    if (items[index]["text"] != null)
                      Text(
                        items[index]["text"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
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
        ),
        SizedBox(height: 24),
      ],
    );
  }
}