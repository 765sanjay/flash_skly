import 'package:flutter/material.dart';
import 'package:blinkit_series/repository/screens/cart/cartscreen.dart';
import 'package:blinkit_series/repository/screens/category/categoryscreen.dart';
import 'package:blinkit_series/repository/screens/home/homescreen.dart';
import 'package:blinkit_series/repository/screens/print/offerscreen.dart';
import 'package:blinkit_series/repository/screens/profile/profilescreen.dart';

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
    OffersScreen(),
    GroceryApp(), // Changed from GroceryApp to ProfileScreen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Changed from dynamic color to a fixed light background
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
          items: const [
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
              icon: Icon(Icons.local_offer),
              label: "Offer",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedItemColor: Color(0xFFFDD90D), // Bright yellow for selected items
          unselectedItemColor: Color(0xFF2F4858).withOpacity(0.6),
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