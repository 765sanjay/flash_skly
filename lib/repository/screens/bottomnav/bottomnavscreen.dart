import 'package:blinkit_series/repository/screens/cart/cartscreen.dart';
import 'package:blinkit_series/repository/screens/category/categoryscreen.dart';
import 'package:blinkit_series/repository/screens/home/homescreen.dart';
import 'package:blinkit_series/repository/screens/print/printscreen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;

  // Color palette
  final Color primaryColor = Color(0xFF009085); // Teal
  final Color secondaryColor = Color(0xFF2F4858); // Dark blue
  final Color accentColor = Color(0xFFF6C445); // Gold
  final Color darkAccent = Color(0xFF006B7C); // Dark teal
  final Color lightAccent = Color(0xFFFDD90D); // Bright yellow

  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    CategoryScreen(),
    PrintScreen(),
  ];

  // Colors for each tab
  List<Color> pageColors = [
    Color(0xFF009085), // Home - Teal
    Color(0xFFF6C445), // Cart - Gold
    Color(0xFF2F4858), // Categories - Dark blue
    Color(0xFF006B7C), // Print - Dark teal
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColors[currentIndex].withOpacity(0.1),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.print),
              label: "Print",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedItemColor: lightAccent, // Bright yellow for selected items
          unselectedItemColor: secondaryColor.withOpacity(0.6),
          backgroundColor: Colors.white,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}