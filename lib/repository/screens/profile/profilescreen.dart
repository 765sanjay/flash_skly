import 'package:flutter/material.dart';

void main() {
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FreshCart',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF009085, {
          50: const Color(0xFFE0F2F1),
          100: const Color(0xFFB2DFDB),
          200: const Color(0xFF80CBC4),
          300: const Color(0xFF4DB6AC),
          400: const Color(0xFF26A69A),
          500: const Color(0xFF009085),
          600: const Color(0xFF00897B),
          700: const Color(0xFF00796B),
          800: const Color(0xFF00695C),
          900: const Color(0xFF004D40),
        }),
      ),
      home: const ProfilePage(),
      routes: {
        '/personalInfo': (context) => const PersonalInfoPage(),
        '/orderHistory': (context) => const OrderHistoryPage(),
        '/favorites': (context) => const FavoritesPage(),
        '/notifications': (context) => const NotificationsPage(),
      },
    );
  }
}

// Personal Information Page
class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Information'),
        backgroundColor: const Color(0xFF009085),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard('Full Name', 'Sarah Johnson'),
            _buildInfoCard('Email', 'sarah.johnson@example.com'),
            _buildInfoCard('Phone Number', '+1 (555) 123-4567'),
            _buildInfoCard('Date of Birth', 'January 15, 1990'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF009085),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Edit Information'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Order History Page
class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
        backgroundColor: const Color(0xFF009085),
      ),
      body: ListView(
        children: [
          _buildOrderItem('ORD-12345', 'Delivered', '\$85.99', 'May 15, 2023'),
          _buildOrderItem('ORD-12344', 'Delivered', '\$42.50', 'May 10, 2023'),
          _buildOrderItem('ORD-12343', 'Cancelled', '\$63.75', 'May 5, 2023'),
          _buildOrderItem('ORD-12342', 'Delivered', '\$91.20', 'April 28, 2023'),
          _buildOrderItem('ORD-12341', 'Delivered', '\$35.99', 'April 20, 2023'),
        ],
      ),
    );
  }

  Widget _buildOrderItem(String orderId, String status, String amount, String date) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #$orderId',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: status == 'Delivered'
                        ? Colors.green.withOpacity(0.2)
                        : Colors.red.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: status == 'Delivered' ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Total: $amount',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              date,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'VIEW DETAILS',
                  style: TextStyle(
                    color: Color(0xFF009085),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Favorites Page
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: const Color(0xFF009085),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        padding: const EdgeInsets.all(16),
        children: [
          _buildFavoriteItem('Organic Apples', '\$2.99/kg', 'assets/apples.jpg'),
          _buildFavoriteItem('Bananas', '\$1.49/kg', 'assets/bananas.jpg'),
          _buildFavoriteItem('Almond Milk', '\$3.99', 'assets/almond_milk.jpg'),
          _buildFavoriteItem('Whole Wheat Bread', '\$2.49', 'assets/bread.jpg'),
          _buildFavoriteItem('Organic Eggs', '\$4.99', 'assets/eggs.jpg'),
          _buildFavoriteItem('Avocados', '\$1.99 each', 'assets/avocados.jpg'),
        ],
      ),
    );
  }

  Widget _buildFavoriteItem(String name, String price, String imagePath) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Notifications Page
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: const Color(0xFF009085),
      ),
      body: ListView(
        children: [
          _buildNotificationItem(
            'Order Delivered',
            'Your order #ORD-12345 has been delivered',
            'Today, 10:30 AM',
            Icons.local_shipping,
          ),
          _buildNotificationItem(
            'Special Offer',
            'Get 20% off on all fruits this weekend',
            'Yesterday, 2:15 PM',
            Icons.discount,
          ),
          _buildNotificationItem(
            'Payment Received',
            'Payment of \$85.99 for order #ORD-12345 has been received',
            'May 15, 2023',
            Icons.payment,
          ),
          _buildNotificationItem(
            'New Product',
            'Check out our new organic range now available',
            'May 12, 2023',
            Icons.new_releases,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(
      String title, String message, String time, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF009085).withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF009085)),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            const SizedBox(height: 4),
            Text(
              time,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Delivery Address Expansion
class DeliveryAddressExpansion extends StatefulWidget {
  const DeliveryAddressExpansion({super.key});

  @override
  State<DeliveryAddressExpansion> createState() =>
      _DeliveryAddressExpansionState();
}

class _DeliveryAddressExpansionState extends State<DeliveryAddressExpansion> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Delivery Addresses'),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF006B7C).withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.location_on_outlined,
          color: Color(0xFF006B7C),
        ),
      ),
      trailing: Icon(
        _expanded ? Icons.expand_less : Icons.expand_more,
        color: Colors.grey,
      ),
      onExpansionChanged: (expanded) {
        setState(() {
          _expanded = expanded;
        });
      },
      children: [
        _buildAddressItem(
          'Home',
          '123 Main St, Apt 4B\nNew York, NY 10001\nUnited States',
          true,
        ),
        _buildAddressItem(
          'Work',
          '456 Business Ave, Floor 12\nNew York, NY 10005\nUnited States',
          false,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Color(0xFF009085)),
            label: const Text(
              'Add New Address',
              style: TextStyle(color: Color(0xFF009085)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressItem(String type, String address, bool isDefault) {
    return ListTile(
      title: Row(
        children: [
          Text(
            type,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          if (isDefault) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Default',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ],
      ),
      subtitle: Text(address),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit, size: 20),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete, size: 20),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// Help Center Expansion
class HelpCenterExpansion extends StatefulWidget {
  const HelpCenterExpansion({super.key});

  @override
  State<HelpCenterExpansion> createState() => _HelpCenterExpansionState();
}

class _HelpCenterExpansionState extends State<HelpCenterExpansion> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Help Center'),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF2F4858).withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.help_outline,
          color: Color(0xFF2F4858),
        ),
      ),
      trailing: Icon(
        _expanded ? Icons.expand_less : Icons.expand_more,
        color: Colors.grey,
      ),
      onExpansionChanged: (expanded) {
        setState(() {
          _expanded = expanded;
        });
      },
      children: [
        ListTile(
          leading: const Icon(Icons.phone, color: Color(0xFF009085)),
          title: const Text('Contact Us'),
          subtitle: const Text('+1 (800) 123-4567'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.email, color: Color(0xFF009085)),
          title: const Text('Email Support'),
          subtitle: const Text('support@freshcart.com'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.chat, color: Color(0xFF009085)),
          title: const Text('Live Chat'),
          subtitle: const Text('Available 9AM-5PM EST'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.feedback, color: Color(0xFF009085)),
          title: const Text('Feedback'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.help_center, color: Color(0xFF009085)),
          title: const Text('FAQs'),
          onTap: () {},
        ),
      ],
    );
  }
}

// Main Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        backgroundColor: const Color(0xFF009085),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF009085),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/women/65.jpg'),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Sarah Johnson',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'sarah.johnson@example.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('32', 'Orders'),
                      _buildStatItem('4.9', 'Rating'),
                      _buildStatItem('\$245', 'Saved'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Profile Options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildProfileOption(
                    icon: Icons.person_outline,
                    color: const Color(0xFFF6C445),
                    title: 'Personal Information',
                    onTap: () {
                      Navigator.pushNamed(context, '/personalInfo');
                    },
                  ),
                  const DeliveryAddressExpansion(),
                  _buildProfileOption(
                    icon: Icons.payment_outlined,
                    color: const Color(0xFF2F4858),
                    title: 'Payment Methods',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    icon: Icons.shopping_bag_outlined,
                    color: const Color(0xFF009085),
                    title: 'Order History',
                    onTap: () {
                      Navigator.pushNamed(context, '/orderHistory');
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.favorite_outline,
                    color: const Color(0xFFFDD90D),
                    title: 'Favorites',
                    onTap: () {
                      Navigator.pushNamed(context, '/favorites');
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.notifications_outlined,
                    color: const Color(0xFF006B7C),
                    title: 'Notifications',
                    onTap: () {
                      Navigator.pushNamed(context, '/notifications');
                    },
                  ),
                  const HelpCenterExpansion(),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF6C445),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required Color color,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}