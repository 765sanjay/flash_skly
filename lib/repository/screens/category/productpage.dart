import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skly_flash/repository/providers/cart_provider.dart';

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
      backgroundColor: Colors.grey[50], // Light background for better contrast
      appBar: AppBar(
        title: _showSearch
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: widget.secondaryColor),
                    hintText: 'Search in ${widget.category}',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: widget.secondaryColor.withOpacity(0.5),
                      fontSize: 14,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  style: TextStyle(color: widget.secondaryColor),
                ),
              )
            : Text(
                widget.category,
                style: TextStyle(
                  color: widget.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: IconThemeData(color: widget.secondaryColor),
        actions: [
          IconButton(
            icon: Icon(_showSearch ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: widget.primaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      '0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Enhanced Banner
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [widget.primaryColor, widget.darkAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -50,
                  top: -50,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.category.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Best quality products available',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Shop Now',
                          style: TextStyle(
                            color: widget.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Enhanced Product List
          Expanded(
            child: _filteredProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 48,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No products found',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: widget.primaryColor,
        child: Icon(Icons.shopping_cart),
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left side - Product Image
            ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
              child: Stack(
                children: [
                  Container(
                    width: 140,
                    height: double.infinity,
                    child: Image.asset(
                      product['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: widget.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        product['discount'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Right side - Product Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Brand and Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product['brand'],
                          style: TextStyle(
                            color: widget.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            SizedBox(width: 2),
                            Text(
                              '${product['rating']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              ' (${product['reviews']})',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    // Product Name
                    Text(
                      product['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: widget.secondaryColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Price
                    Row(
                      children: [
                        Text(
                          product['price'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: widget.primaryColor,
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
                    // Delivery Time
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey[600],
                        ),
                        SizedBox(width: 4),
                        Text(
                          product['delivery'],
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    // Add to Cart Button
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              final price = double.parse(product['price'].replaceAll(RegExp(r'[^0-9.]'), ''));
                              final productId = '${product['name']}_${DateTime.now().millisecondsSinceEpoch}';
                              Provider.of<CartProvider>(context, listen: false).addItem(
                                productId,
                                product['name'],
                                product['brand'],
                                price,
                                product['image'],
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Added to cart!'),
                                  duration: Duration(seconds: 2),
                                  action: SnackBarAction(
                                    label: 'UNDO',
                                    onPressed: () {
                                      Provider.of<CartProvider>(context, listen: false).removeItem(productId);
                                    },
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: widget.primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
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
      ),
    );
  }
}