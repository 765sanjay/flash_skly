import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final TextEditingController searchController;

  // Define colors as static constants since they don't change per instance
  static const Color primaryColor = Color(0xFF009085);
  static const Color secondaryColor = Color(0xFF2F4858);
  static const Color accentColor = Color(0xFFF6C445);
  static const Color darkAccent = Color(0xFF006B7C);
  static const Color lightAccent = Color(0xFFFDD90D);

  const AppHeader({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor, darkAccent], // Using the color constants
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
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

          const SizedBox(height: 8),

          // Delivery Text
          Text(
            "8 minutes delivery",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          const SizedBox(height: 16),

          // Location Row
          Row(
            children: [
              Icon(Icons.location_on, color: lightAccent, size: 16),
              const SizedBox(width: 8),
              Expanded(
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

          const Spacer(),

          // Search Bar
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
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
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}