import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  final String category;
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final Color darkAccent;
  final Color lightAccent;

  const ProductsPage({
    Key? key,
    required this.category,
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.darkAccent,
    required this.lightAccent,
  }) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late List<Map<String, dynamic>> _allProducts;
  List<Map<String, dynamic>> _filteredProducts = [];
  final TextEditingController _searchController = TextEditingController();
  bool _showSearch = false;

  @override
  void initState() {
    super.initState();
    _allProducts = _getProducts();
    _filteredProducts = _allProducts;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredProducts = _allProducts.where((product) {
        final name = product['name'].toString().toLowerCase();
        final brand = product['brand'].toString().toLowerCase();
        return name.contains(query) || brand.contains(query);
      }).toList();
    });
  }

  void _toggleSearch() {
    setState(() {
      _showSearch = !_showSearch;
      if (!_showSearch) {
        _searchController.clear();
        _filteredProducts = _allProducts;
      }
    });
  }

  List<Map<String, dynamic>> _getProducts() {
    switch (widget.category) {
      case 'Fruits & Vegetables':
        return [
          {
            'name': 'Fresh Apples',
            'brand': 'Farm Fresh',
            'price': '₹199/kg',
            'originalPrice': '₹220/kg',
            'discount': '10% OFF',
            'rating': 4.5,
            'reviews': 128,
            'image': 'assets/images/apples.jpg',
            'delivery': 'Today by 8 PM'
          },
          {
            'name': 'Organic Tomatoes',
            'brand': 'Organic Farms',
            'price': '₹49/kg',
            'originalPrice': '₹60/kg',
            'discount': '18% OFF',
            'rating': 4.2,
            'reviews': 95,
            'image': 'assets/images/tomatoes.jpg',
            'delivery': 'Today by 8 PM'
          },
        ];
      case 'Dairy, Bread & Eggs':
        return [
          {
            'name': 'Fresh Milk',
            'brand': 'Amul',
            'price': '₹60/liter',
            'originalPrice': '₹65/liter',
            'discount': '8% OFF',
            'rating': 4.7,
            'reviews': 342,
            'image': 'assets/images/milk.jpg',
            'delivery': 'Today by 8 PM'
          },
          {
            'name': 'Farm Eggs',
            'brand': 'Eggoz',
            'price': '₹90/dozen',
            'originalPrice': '₹100/dozen',
            'discount': '10% OFF',
            'rating': 4.6,
            'reviews': 215,
            'image': 'assets/images/eggs.jpg',
            'delivery': 'Today by 8 PM'
          },
        ];
      case 'Tea, Coffee & More':
        return [
          {
            'name': 'Premium Tea',
            'brand': 'Taj Mahal',
            'price': '₹250/500g',
            'originalPrice': '₹300/500g',
            'discount': '17% OFF',
            'rating': 4.8,
            'reviews': 512,
            'image': 'assets/images/tea.jpg',
            'delivery': 'Today by 8 PM'
          },
          {
            'name': 'Instant Coffee',
            'brand': 'Nescafe',
            'price': '₹180/100g',
            'originalPrice': '₹200/100g',
            'discount': '10% OFF',
            'rating': 4.6,
            'reviews': 387,
            'image': 'assets/images/coffee.jpg',
            'delivery': 'Today by 8 PM'
          },
        ];
      case 'Headphones':
        return [
          {
            'name': 'Wireless Headphones',
            'brand': 'Boat',
            'price': '₹1,299',
            'originalPrice': '₹1,799',
            'discount': '28% OFF',
            'rating': 4.5,
            'reviews': 1245,
            'image': 'assets/images/headphones.jpg',
            'delivery': 'Tomorrow by 5 PM'
          },
          {
            'name': 'Ear Buds',
            'brand': 'OnePlus',
            'price': '₹2,999',
            'originalPrice': '₹3,999',
            'discount': '25% OFF',
            'rating': 4.7,
            'reviews': 876,
            'image': 'assets/images/earbuds.jpg',
            'delivery': 'Tomorrow by 5 PM'
          },
        ];
      case 'Skincare':
        return [
          {
            'name': 'Face Wash',
            'brand': 'Garnier',
            'price': '₹149',
            'originalPrice': '₹199',
            'discount': '25% OFF',
            'rating': 4.6,
            'reviews': 789,
            'image': 'assets/images/facewash.jpg',
            'delivery': 'Today by 8 PM'
          },
          {
            'name': 'Moisturizer',
            'brand': 'Nivea',
            'price': '₹199',
            'originalPrice': '₹249',
            'discount': '20% OFF',
            'rating': 4.5,
            'reviews': 654,
            'image': 'assets/images/moisturizer.jpg',
            'delivery': 'Today by 8 PM'
          },
        ];
      default:
        return [
          {
            'name': 'Sample Product 1',
            'brand': 'Brand X',
            'price': '₹999',
            'originalPrice': '₹1,199',
            'discount': '17% OFF',
            'rating': 4.3,
            'reviews': 156,
            'image': 'assets/images/sample1.jpg',
            'delivery': '2 Days'
          },
          {
            'name': 'Sample Product 2',
            'brand': 'Brand Y',
            'price': '₹1,499',
            'originalPrice': '₹1,799',
            'discount': '17% OFF',
            'rating': 4.1,
            'reviews': 98,
            'image': 'assets/images/sample2.jpg',
            'delivery': '3 Days'
          },
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showSearch
            ? TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search in ${widget.category}',
            border: InputBorder.none,
            hintStyle: TextStyle(color: widget.secondaryColor.withOpacity(0.5)),
          ),
          style: TextStyle(color: widget.secondaryColor),
        )
            : Text(widget.category, style: TextStyle(color: widget.secondaryColor)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: widget.secondaryColor),
        actions: [
          IconButton(
            icon: Icon(_showSearch ? Icons.close : Icons.search,
                color: widget.secondaryColor),
            onPressed: _toggleSearch,
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: widget.secondaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Banner
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [widget.primaryColor, widget.darkAccent],
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
                    '${widget.category.toUpperCase()}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Best quality products available',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Shop Now >',
                    style: TextStyle(
                      color: widget.lightAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Product List
          Expanded(
            child: _filteredProducts.isEmpty
                ? Center(
              child: Text(
                'No products found',
                style: TextStyle(
                  fontSize: 18,
                  color: widget.secondaryColor,
                ),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                return _buildProductCard(_filteredProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      product['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Discount badge
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: widget.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          product['discount'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Product name
                      Text(
                        product['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: widget.secondaryColor,
                        ),
                      ),
                      SizedBox(height: 4),
                      // Brand
                      Text(
                        product['brand'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8),
                      // Price
                      Row(
                        children: [
                          Text(
                            product['price'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: widget.secondaryColor,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            product['originalPrice'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      // Rating and delivery
                      Row(
                        children: [
                          Icon(Icons.star, color: widget.accentColor, size: 16),
                          SizedBox(width: 4),
                          Text(
                            '${product['rating']} (${product['reviews']})',
                            style: TextStyle(fontSize: 12),
                          ),
                          Spacer(),
                          Text(
                            product['delivery'],
                            style: TextStyle(
                              fontSize: 12,
                              color: widget.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            // Add to cart button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: widget.secondaryColor,
                  backgroundColor: widget.accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {},
                child: Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}