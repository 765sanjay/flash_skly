import 'package:flutter/material.dart';
import 'package:skly_flash/repository/screens/cart/cartscreen.dart';
import 'package:skly_flash/repository/screens/category/categoryscreen.dart';
import 'package:skly_flash/repository/screens/home/homescreen.dart';
import 'package:skly_flash/repository/screens/print/offerscreen.dart';
import 'package:skly_flash/repository/screens/profile/profilescreen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;

  // Enhanced color palette
  final Color primaryColor = Color(0xFF009085);    // Teal
  final Color secondaryColor = Color(0xFF2F4858);  // Dark blue
  final Color accentColor = Color(0xFFF6C445);     // Gold
  final Color darkAccent = Color(0xFF006B7C);      // Dark teal
  final Color lightAccent = Color(0xFFFDD90D);     // Bright yellow

  // Page-specific colors
  late final List<Color> pageColors = [
    primaryColor,    // Home
    accentColor,     // Cart
    darkAccent,      // Categories
    lightAccent,     // Offers
    secondaryColor,  // Profile
  ];

  late final List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    CategoryScreen(),
    OffersScreen(),
    GroceryApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(0, Icons.home_rounded, "Home"),
                _buildNavItem(1, Icons.shopping_cart_rounded, "Cart"),
                _buildNavItem(2, Icons.category_rounded, "Categories"),
                _buildNavItem(3, Icons.local_offer_rounded, "Offers"),
                _buildNavItem(4, Icons.person_rounded, "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = currentIndex == index;
    Color itemColor = pageColors[index];

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => setState(() => currentIndex = index),
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 70,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon with animated container background
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSelected ? itemColor.withOpacity(0.1) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: isSelected ? itemColor : Colors.grey,
                  size: 22,
                ),
              ),
              SizedBox(height: 4),
              // Label
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? itemColor : Colors.grey,
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Optional: Add page transition animation
  Widget _buildPageTransition(Widget page, int index) {
    return AnimatedBuilder(
      animation: ModalRoute.of(context)?.animation ?? AlwaysStoppedAnimation(0),
      builder: (context, child) {
        return FadeTransition(
          opacity: Tween<double>(
            begin: index == currentIndex ? 1.0 : 0.0,
            end: index == currentIndex ? 1.0 : 0.0,
          ).animate(
            CurvedAnimation(
              parent: ModalRoute.of(context)?.animation ?? AlwaysStoppedAnimation(0),
              curve: Curves.easeInOut,
            ),
          ),
          child: child,
        );
      },
      child: page,
    );
  }
}