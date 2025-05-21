import 'package:flutter/material.dart';
import 'package:skly_flash/repository/app_header.dart';

class MarkatHome extends StatefulWidget {
  @override
  _MarkatHomeState createState() => _MarkatHomeState();
}

class _MarkatHomeState extends State<MarkatHome> {
  TextEditingController searchController = TextEditingController();
  
  // Color palette (using existing app colors)
  final Color primaryColor = Color(0xFF009085);    // Teal
  final Color secondaryColor = Color(0xFF2F4858);  // Dark blue
  final Color accentColor = Color(0xFFF6C445);     // Gold
  final Color darkAccent = Color(0xFF006B7C);      // Dark teal
  final Color lightAccent = Color(0xFFFDD90D);     // Bright yellow

  // Sample product data
  final List<Map<String, dynamic>> featuredProducts = [
    {
      'name': 'Nutty Gritties Cranberries',
      'originalPrice': 285,
      'discountedPrice': 205,
      'discount': 80,
      'image': 'assets/images/cranberries.png',
      'weight': '200 g',
      'deliveryTime': '10 Mins'
    },
    {
      'name': 'Onion (Vengayam)',
      'originalPrice': 68,
      'discountedPrice': 26,
      'discount': 42,
      'image': 'assets/images/onion.png',
      'weight': '1 kg',
      'deliveryTime': '10 Mins'
    },
    {
      'name': 'Tomato Country',
      'originalPrice': 20,
      'discountedPrice': 8,
      'discount': 12,
      'image': 'assets/images/tomato.png',
      'weight': '500 g',
      'deliveryTime': '10 Mins'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Using existing AppHeader
          AppHeader(searchController: searchController),

          // Main content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Super Saver Banner
                  Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [primaryColor, darkAccent],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Super Saver',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            'UP TO 40% OFF',
                            style: TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Products Grid
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Products For You',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor,
                          ),
                        ),
                        SizedBox(height: 16),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemCount: featuredProducts.length,
                          itemBuilder: (context, index) {
                            final product = featuredProducts[index];
                            return _buildProductCard(product);
                          },
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

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                image: DecorationImage(
                  image: AssetImage(product['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Product Details
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Product Name and Weight
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        product['weight'],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  // Price and Add to Cart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '₹${product['discountedPrice']}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '₹${product['originalPrice']}',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      // Add to Cart Button
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'ADD',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 