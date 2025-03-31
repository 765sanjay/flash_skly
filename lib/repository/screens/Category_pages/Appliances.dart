import 'package:flutter/material.dart';

class KitchenAppliancesPage extends StatelessWidget {
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
        title: Text('Kitchen & Appliances', style: TextStyle(color: darkBlue)),
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
                      'UPGRADE YOUR KITCHEN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Modern appliances for easy cooking',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Shop Now >',
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
                  _buildCategoryChip('Cookware'),
                  _buildCategoryChip('Storage'),
                  _buildCategoryChip('Small Appliances'),
                  _buildCategoryChip('Tableware'),
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
                    name: 'Non-Stick Frying Pan',
                    brand: 'Prestige',
                    description: 'Heavy-duty non-stick cookware',
                    weight: '24 cm',
                    rating: 4.7,
                    reviewCount: 435,
                    price: '₹899',
                    originalPrice: '₹999',
                    deliveryTime: '2 Days',
                  ),
                  Divider(),
                  _buildProductItem(
                    discount: '15%',
                    name: 'Electric Kettle - 1.5L',
                    brand: 'Philips',
                    description: 'Fast heating with auto cut-off',
                    weight: '1.5 Liters',
                    rating: 4.6,
                    reviewCount: 789,
                    price: '₹1,499',
                    originalPrice: '₹1,799',
                    deliveryTime: '1 Day',
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
          Text(brand, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          SizedBox(height: 4),
          Text(description, style: TextStyle(fontSize: 12, color: Color(0xFF2F4858))),
          SizedBox(height: 8),
          Row(
            children: [
              Text(weight, style: TextStyle(fontSize: 12, color: Colors.grey)),
              Spacer(),
              Text(deliveryTime, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Color(0xFFF6C445), size: 16),
              SizedBox(width: 4),
              Text('$rating ($reviewCount)', style: TextStyle(fontSize: 12, color: Color(0xFF2F4858))),
              Spacer(),
              Text(price, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2F4858))),
              SizedBox(width: 16),
              ElevatedButton(onPressed: () {}, child: Text('Add to Cart')),
            ],
          ),
        ],
      ),
    );
  }
}
