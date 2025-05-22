import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skly_flash/repository/providers/profile_provider.dart';
import 'package:skly_flash/repository/screens/bottomnav/bottomnavscreen.dart';
import 'package:skly_flash/repository/providers/toggle_provider.dart';

class AppHeader extends StatefulWidget {
  final TextEditingController searchController;
  final Function(bool) onSearchStateChanged;

  static const Color primaryColor = Color(0xFF009085);
  static const Color secondaryColor = Color(0xFF2F4858);
  static const Color accentColor = Color(0xFFF6C445);
  static const Color darkAccent = Color(0xFF006B7C);
  static const Color lightAccent = Color(0xFFFDD90D);

  const AppHeader({
    Key? key,
    required this.searchController,
    required this.onSearchStateChanged,
  }) : super(key: key);

  @override
  _AppHeaderState createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    widget.searchController.removeListener(_onSearchChanged);
    super.dispose();
  }

  void _onSearchChanged() {
    final isCurrentlySearching = widget.searchController.text.isNotEmpty;
    if (isCurrentlySearching != isSearching) {
      setState(() {
        isSearching = isCurrentlySearching;
      });
      widget.onSearchStateChanged(isSearching);
    }
  }

  @override
  Widget build(BuildContext context) {
    final toggleProvider = Provider.of<ToggleProvider>(context);
    final double toggleWidth = MediaQuery.of(context).size.width * 0.5 - 25;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isSearching ? Colors.white : null,
        gradient: isSearching ? null : LinearGradient(
          colors: [Color(0xFF009085), Color(0xFF006B7C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSearching) ...[
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 2,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: toggleProvider.isSklyFlashSelected ? 0 : toggleWidth,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: toggleWidth,
                    decoration: BoxDecoration(
                      color: toggleProvider.isSklyFlashSelected ? Colors.grey.shade300 : Colors.green.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          toggleProvider.toggle(true);
                        },
                        child: SizedBox(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/toggle 1.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          toggleProvider.toggle(false);
                        },
                        child: SizedBox(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/toggle 2.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 8),

            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              child: Text(
                toggleProvider.isSklyFlashSelected ? "8 minutes delivery" : "Marketplace",
              ),
            ),

            const SizedBox(height: 16),

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
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 16),
          ],

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
                suffixIcon: isSearching ? IconButton(
                  icon: Icon(Icons.clear, color: AppHeader.secondaryColor),
                  onPressed: () {
                    widget.searchController.clear();
                  },
                ) : null,
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