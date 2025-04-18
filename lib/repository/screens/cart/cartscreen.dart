import 'package:skly_flash/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:skly_flash/repository/app_header.dart';
class CartScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  // Color palette
  final Color primaryColor = Color(0xFF009085);
  final Color secondaryColor = Color(0xFF2F4858);
  final Color accentColor = Color(0xFFF6C445);
  final Color darkAccent = Color(0xFF006B7C);
  final Color lightAccent = Color(0xFFFDD90D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Section
          AppHeader(searchController: searchController),

          // Empty Cart Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: UiHelper.CustomImage(
                          img: "cart.png",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  UiHelper.CustomText(
                    text: "Reordering will be easy",
                    color: secondaryColor,
                    fontweight: FontWeight.bold,
                    fontsize: 18,
                    fontfamily: "bold",
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Items you order will show up here so you can buy them again easily.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: secondaryColor.withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),

                  // Bestsellers Section
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: UiHelper.CustomText(
                            text: "Bestsellers",
                            color: secondaryColor,
                            fontweight: FontWeight.bold,
                            fontsize: 18,
                            fontfamily: "bold",
                          ),
                        ),
                        SizedBox(height: 16),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(width: 8),
                              _buildProductCard("milk.png"),
                              SizedBox(width: 16),
                              _buildProductCard("potato.png"),
                              SizedBox(width: 16),
                              _buildProductCard("tomato.png"),
                              SizedBox(width: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String imagePath) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.all(12),
            child: Center(
              child: SizedBox(
                width: 80,
                height: 80,
                child: UiHelper.CustomImage(
                  img: imagePath,
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.2),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            child: Center(
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: accentColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: Colors.white, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}