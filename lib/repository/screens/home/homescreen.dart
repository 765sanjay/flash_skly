import 'package:skly_flash/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:skly_flash/repository/app_header.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  // Color palette
  final Color primaryColor = Color(0xFF009085);
  final Color secondaryColor = Color(0xFF2F4858);
  final Color accentColor = Color(0xFFF6C445);
  final Color darkAccent = Color(0xFF006B7C);
  final Color lightAccent = Color(0xFFFDD90D);
  var data = [
    {"img": "image 50.png", "text": "Lights, Diyas \n & Candles"},
    {"img": "image 51.png", "text": "Diwali \n Gifts"},
    {"img": "image 52.png", "text": "Appliances  \n & Gadgets"},
    {"img": "image 53.png", "text": "Home \n & Living"}
  ];
  var category = [
    {"img": "image 54.png", "text": "Golden Glass\n Wooden Lid Candle (Oudh)", "price": "₹79", "time": "8 MINS"},
    {"img": "image 57.png", "text": "Royal Gulab Jamun\n By Bikano", "price": "₹129", "time": "10 MINS"},
    {"img": "image 63.png", "text": "Premium Dry Fruits\n Pack", "price": "₹349", "time": "15 MINS"},
  ];
  var grocerykitchen = [
    {"img": "image 41.png", "text": "Vegetables & \nFruits", "color": Color(0xFFF6C445)},
    {"img": "image 42.png", "text": "Atta, Dal & \nRice", "color": Color(0xFF009085)},
    {"img": "image 43.png", "text": "Oil, Ghee & \nMasala", "color": Color(0xFF2F4858)},
    {"img": "image 44.png", "text": "Dairy, Bread & \nMilk", "color": Color(0xFF006B7C)},
    {"img": "image 45.png", "text": "Biscuits & \nBakery", "color": Color(0xFFFDD90D)}
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            // Header Section (corrected)
            AppHeader(searchController: searchController),
            // Categories Section (updated image height handling)
            // In your HomeScreen class, modify the "Shop by Category" section:

            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UiHelper.CustomText(
                      text: "Shop by Category",
                      color: Color(0xFF2F4858),
                      fontweight: FontWeight.bold,
                      fontsize: 18,
                      fontfamily: "bold"
                  ),
                  TextButton(
                    onPressed: () {

                    },
                    child: UiHelper.CustomText(
                      text: "See all",
                      color: Color(0xFF009085),
                      fontweight: FontWeight.bold,
                      fontsize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.20,  // Increased from 0.18 to 0.20
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: grocerykitchen.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start, // Changed from spaceBetween
                      children: [
                        Container(
                          height: screenHeight * 0.12,
                          width: screenWidth * 0.22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: grocerykitchen[index]["color"] as Color,
                            boxShadow: [
                            BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                            ),
                            ],
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 60,
                              child: UiHelper.CustomImage(
                                img: grocerykitchen[index]["img"].toString(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          width: screenWidth * 0.22,
                          child: Center(
                            child: UiHelper.CustomText(
                              text: grocerykitchen[index]["text"].toString(),
                              color: Color(0xFF2F4858),
                              fontweight: FontWeight.w600,
                              fontsize: 11,  // Reduced from 12 to 11
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Featured Products (updated image height handling)
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UiHelper.CustomText(
                      text: "Featured Products",
                      color: Color(0xFF2F4858),
                      fontweight: FontWeight.bold,
                      fontsize: 18,
                      fontfamily: "bold"
                  ),
                  TextButton(
                    onPressed: () {},
                    child: UiHelper.CustomText(
                      text: "See all",
                      color: Color(0xFF009085),
                      fontweight: FontWeight.bold,
                      fontsize: 14,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: screenHeight * 0.32,  // Increased from 0.28 to 0.32
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: screenWidth * 0.35,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start, // Changed from default
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                          child: Container(
                            height: screenHeight * 0.14,  // Reduced from 0.15 to 0.14
                            color: Colors.grey[100],
                            child: Center(
                              child: SizedBox(
                                height: 70,  // Reduced from 80 to 70
                                child: UiHelper.CustomImage(
                                  img: category[index]["img"].toString(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),  // Reduced from 10 to 8
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: screenWidth * 0.3,
                                child: UiHelper.CustomText(
                                  text: category[index]["text"].toString(),
                                  color: Color(0xFF2F4858),
                                  fontweight: FontWeight.w600,
                                  fontsize: 11,  // Reduced from 12 to 11
                                ),
                              ),
                              SizedBox(height: 8),  // Reduced from 10 to 8
                              Row(
                                children: [
                                  Icon(Icons.timer, size: 14, color: Color(0xFF009085)),  // Reduced from 16 to 14
                                  SizedBox(width: 4),  // Reduced from 5 to 4
                                  UiHelper.CustomText(
                                    text: category[index]["time"].toString(),
                                    color: Color(0xFF009085),
                                    fontweight: FontWeight.w500,
                                    fontsize: 11,  // Reduced from 12 to 11
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),  // Reduced from 5 to 4
                              UiHelper.CustomText(
                                text: category[index]["price"].toString(),
                                color: Color(0xFF009085),
                                fontweight: FontWeight.bold,
                                fontsize: 14,  // Reduced from 16 to 14
                              ),
                              SizedBox(height: 4),  // Reduced from 5 to 4
                              Container(
                                width: double.infinity,
                                height: 28,  // Reduced from 30 to 28
                                decoration: BoxDecoration(
                                  color: Color(0xFFFDD90D),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: UiHelper.CustomText(
                                    text: "Add to Cart",
                                    color: Color(0xFF2F4858),
                                    fontweight: FontWeight.bold,
                                    fontsize: 11,  // Reduced from 12 to 11
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Special Offers Banner (unchanged)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                height: screenHeight * 0.15,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Color(0xFFF6C445), Color(0xFFFDD90D)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      top: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                            text: "Special Offer",
                            color: Color(0xFF2F4858),
                            fontweight: FontWeight.bold,
                            fontsize: 18,
                          ),
                          UiHelper.CustomText(
                            text: "20% OFF on first order",
                            color: Color(0xFF2F4858),
                            fontweight: FontWeight.w500,
                            fontsize: 14,
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              color: Color(0xFF2F4858),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: UiHelper.CustomText(
                              text: "GRAB NOW",
                              color: Colors.white,
                              fontweight: FontWeight.bold,
                              fontsize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 0,
                      child: Image.asset(
                        "assets/images/grocery_bag.png",
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}