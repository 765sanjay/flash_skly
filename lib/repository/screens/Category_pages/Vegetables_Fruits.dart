import 'package:flutter/material.dart';

class FruitsVegetablesPage extends StatelessWidget {
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
        title: Text('Fruits & Vegetables', style: TextStyle(color: darkBlue)),
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
                      'SEASON OF THE KING',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Naturally ripened, from handpicked farms',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Explore now >',
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
                  _buildCategoryChip('Fresh'),
                  _buildCategoryChip('Organic'),
                  _buildCategoryChip('Seasonal'),
                  _buildCategoryChip('Exotic'),
                ],
              ),
            ),

            // Carbide Free Tag
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.verified, color: primaryTeal, size: 16),
                  SizedBox(width: 4),
                  Text(
                    'CARBIDE FREE',
                    style: TextStyle(
                      color: primaryTeal,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' Fresh Vegetables',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
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
                    discount: '3%',
                    name: 'Jumbo Dried Apricots',
                    brand: 'Khari Foods',
                    description: 'Apricot / Khubani...',
                    weight: '200 g',
                    rating: 4.5,
                    reviewCount: 569,
                    price: '₹375',
                    originalPrice: '₹387.72',
                    deliveryTime: '20 Mins',
                  ),
                  Divider(),
                  _buildProductItem(
                    discount: '21%',
                    name: 'Nature Plus Tomato - Seeds',
                    brand: 'Hurray! Enjoy your press benefits',
                    description: 'Free delivery coupon unlocked!',
                    weight: '1 pc',
                    rating: 4.4,
                    reviewCount: 897,
                    price: '₹63',
                    originalPrice: '₹79.92',
                    deliveryTime: '30 Mins',
                    hasSpecialOffer: true,
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
    bool hasSpecialOffer = false,
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
          if (hasSpecialOffer) ...[
            SizedBox(height: 4),
            Text(
              'Free delivery coupon unlocked!',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF009085),
              ),
            ),
            SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'APPLY >',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF009085),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          SizedBox(height: 8),
          Row(
            children: [
              // Weight
              Text(
                weight,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              // Delivery Time
              Text(
                deliveryTime,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              // Rating
              Row(
                children: [
                  Icon(Icons.star, color: Color(0xFFF6C445), size: 16),
                  SizedBox(width: 4),
                  Text(
                    '$rating ($reviewCount)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2F4858),
                    ),
                  ),
                ],
              ),
              Spacer(),
              // Price
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2F4858),
                    ),
                  ),
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
              SizedBox(width: 16),
              // Add to Cart Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF6C445),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(color: Color(0xFF2F4858)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}