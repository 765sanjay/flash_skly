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
          50: Color(0xFFE0F2F1),
          100: Color(0xFFB2DFDB),
          200: Color(0xFF80CBC4),
          300: Color(0xFF4DB6AC),
          400: Color(0xFF26A69A),
          500: Color(0xFF009085),
          600: Color(0xFF00897B),
          700: Color(0xFF00796B),
          800: Color(0xFF00695C),
          900: Color(0xFF004D40),
        }),
      ),
      home: const ProfilePage(),
    );
  }
}

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
                  ),
                  _buildProfileOption(
                    icon: Icons.location_on_outlined,
                    color: const Color(0xFF006B7C),
                    title: 'Delivery Addresses',
                  ),
                  _buildProfileOption(
                    icon: Icons.payment_outlined,
                    color: const Color(0xFF2F4858),
                    title: 'Payment Methods',
                  ),
                  _buildProfileOption(
                    icon: Icons.shopping_bag_outlined,
                    color: const Color(0xFF009085),
                    title: 'Order History',
                  ),
                  _buildProfileOption(
                    icon: Icons.favorite_outline,
                    color: const Color(0xFFFDD90D),
                    title: 'Favorites',
                  ),
                  _buildProfileOption(
                    icon: Icons.notifications_outlined,
                    color: const Color(0xFF006B7C),
                    title: 'Notifications',
                  ),
                  _buildProfileOption(
                    icon: Icons.help_outline,
                    color: const Color(0xFF2F4858),
                    title: 'Help Center',
                  ),
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
        onTap: () {},
      ),
    );
  }
}