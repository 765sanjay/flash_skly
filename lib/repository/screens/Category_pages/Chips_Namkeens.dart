import 'package:flutter/material.dart';

class ChipsNamkeensPage extends StatelessWidget {
  // Color palette
  final Color primaryYellow = Color(0xFFF6C445);
  final Color primaryTeal = Color(0xFF009085);
  final Color darkBlue = Color(0xFF2F4858);
  final Color darkTeal = Color(0xFF006B7C);
  final Color lightYellow = Color(0xFFFDD90D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chips & Namkeens', style: TextStyle(color: darkBlue)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: darkBlue),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: darkBlue),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Banner
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryTeal, darkTeal],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'CRUNCHY & TASTY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Satisfy your cravings with our crispy collection',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Shop now >',
                      style: TextStyle(
                        color: lightYellow,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Categories Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  _buildCategoryChip('All', isSelected: true),
                  _buildCategoryChip('Potato Chips'),
                  _buildCategoryChip('Namkeens'),
                  _buildCategoryChip('Baked Snacks'),
                  _buildCategoryChip('Healthy Snacks'),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Product List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildProductItem(
                    discount: '10%',
                    name: 'Classic Salted Potato Chips',
                    brand: 'Lays',
                    description: 'Crispy & light potato chips',
                    weight: '150 g',
                    rating: 4.6,
                    reviewCount: 432,
                    price: '₹50',
                    originalPrice: '₹55',
                    deliveryTime: '15 Mins',
                  ),
                  Divider(),
                  _buildProductItem(
                    discount: '15%',
                    name: 'Masala Namkeen Mix',
                    brand: 'Haldiram s',
                    description: 'Spicy and crunchy mixture',
                    weight: '200 g',
                    rating: 4.5,
                    reviewCount: 780,
                    price: '₹85',
                    originalPrice: '₹100',
                    deliveryTime: '20 Mins',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: Color(0xFF009085),
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Color(0xFF2F4858),
        ),
        onSelected: (bool selected) {},
      ),
    );
  }

  Widget _buildProductItem({
    required String discount,
    required String name,
    required String brand,
    required String description,
    required String weight,
    required double rating,
    required int reviewCount,
    required String price,
    required String originalPrice,
    required String deliveryTime,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Discount Tag
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Color(0xFF009085),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  discount,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 8),
              // Product Name
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F4858),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          // Brand
          Text(
            brand,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 4),
          // Description
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF2F4858),
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              // Price
              Text(
                price,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F4858),
                ),
              ),
              SizedBox(width: 8),
              Text(
                originalPrice,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
