import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skly_flash/repository/providers/profile_provider.dart';

class AppHeader extends StatefulWidget {
  final TextEditingController searchController;

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
  _AppHeaderState createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  bool isSklyFlashSelected = true; // Toggle state

  @override
  Widget build(BuildContext context) {
    final double toggleWidth = MediaQuery.of(context).size.width * 0.45; // Adjust width dynamically

    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF009085), Color(0xFF006B7C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Toggle Bar with Highlight Box
          Stack(
            children: [
              // Highlight Box
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: 30,
                width: toggleWidth, // Use dynamic width
                margin: EdgeInsets.only(
                  left: isSklyFlashSelected ? 0 : toggleWidth, // Adjust position dynamically
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              // Toggle Options
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSklyFlashSelected = true;
                      });
                    },
                    child: Container(
                      width: toggleWidth,
                      alignment: Alignment.center,
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          color: isSklyFlashSelected ? Colors.white : Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: isSklyFlashSelected ? 20 : 18,
                        ),
                        child: Text("SKLY Flash"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSklyFlashSelected = false;
                      });
                    },
                    child: Container(
                      width: toggleWidth,
                      alignment: Alignment.center,
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          color: !isSklyFlashSelected ? Colors.white : Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: !isSklyFlashSelected ? 20 : 18,
                        ),
                        child: Text("Flash Marketplace"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Animated Delivery Text
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            child: Text(
              isSklyFlashSelected ? "8 minutes delivery" : "Marketplace",
            ),
          ),


          const SizedBox(height: 16),

          // Location Row with Dropdown
          Consumer<ProfileProvider>(
            builder: (context, profileProvider, child) {
              return GestureDetector(
                onTap: () {
                  _showAddressDropdown(context, profileProvider);
                },
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: AppHeader.lightAccent, size: 16),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        profileProvider.selectedAddress.isNotEmpty
                            ? profileProvider.selectedAddress
                            : "Select Address",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis, // Truncate text with ellipsis
                        maxLines: 1, // Limit to one line
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              );
            },
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
              controller: widget.searchController,
              decoration: InputDecoration(
                hintText: "Search for products...",
                prefixIcon: Icon(Icons.search, color: AppHeader.secondaryColor),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddressDropdown(BuildContext context, ProfileProvider profileProvider) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: profileProvider.savedAddresses.length,
          itemBuilder: (context, index) {
            final address = profileProvider.savedAddresses[index];
            return ListTile(
              title: Text(address),
              onTap: () {
                profileProvider.updateSelectedAddress(address);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}