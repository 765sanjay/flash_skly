import 'package:flutter/material.dart';
import 'package:skly_flash/repository/app_header.dart';

class CategoryMarket extends StatefulWidget {
  @override
  _CategoryMarketState createState() => _CategoryMarketState();
}

class _CategoryMarketState extends State<CategoryMarket> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with Search Bar
          AppHeader(searchController: searchController),

          // Dummy content for now
          Expanded(
            child: Center(
              child: Text(
                'Market Categories Coming Soon',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppHeader.secondaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 