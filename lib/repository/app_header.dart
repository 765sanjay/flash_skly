import 'package:flutter/material.dart';
import 'package:skly_flash/repository/color_palete/color_palete.dart';

class AppHeader extends StatefulWidget {
  final TextEditingController searchController;

  const AppHeader({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorPalette.primarySwatch[800]!, // Dark teal (0xFF00695C)
            ColorPalette.primarySwatch[400]!, // Medium teal (0xFF26A69A)
            ColorPalette.secondaryColor,      // Dark blue (0xFF2F4858)
          ],
          stops: [0.0, 0.5, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row - Industrial style with company colors
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SKLY FLASH",
                style: TextStyle(
                  color: ColorPalette.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  letterSpacing: 1.2,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: ColorPalette.darkAccent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorPalette.lightAccent,
                    width: 1.5,
                  ),
                ),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: ColorPalette.secondaryColor,
                  child: Icon(
                    Icons.person_outline,
                    color: ColorPalette.accentColor,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Animated Delivery Text - Warning style
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Opacity(
                  opacity: _opacityAnimation.value,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      border: Border(
                        left: BorderSide(
                          color: ColorPalette.accentColor,
                          width: 4,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ColorPalette.accentColor.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.timer,
                          color: ColorPalette.accentColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "8 MINUTES DELIVERY",
                          style: TextStyle(
                            color: ColorPalette.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 1.1,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(1, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16),

          // Location Row - Industrial indicator style
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: ColorPalette.primarySwatch[700]!, // 0xFF00796B
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.location_on, color: ColorPalette.white, size: 14),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "HOME - Sujal Dave, Ratanada, Jodhpur (Raj)",
                  style: TextStyle(
                    color: ColorPalette.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Search Bar - Industrial panel style
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: ColorPalette.secondaryColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: ColorPalette.accentColor.withOpacity(0.4),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
                BoxShadow(
                  color: ColorPalette.primarySwatch[400]!.withOpacity(0.1),
                  blurRadius: 3,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: TextField(
              controller: widget.searchController,
              style: TextStyle(
                color: ColorPalette.white,
                letterSpacing: 0.8,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: "SEARCH PRODUCTS...",
                hintStyle: TextStyle(
                  color: ColorPalette.lightAccent.withOpacity(0.7),
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w500,
                ),
                prefixIcon: Container(
                  padding: EdgeInsets.only(left: 12, right: 8),
                  child: Icon(
                    Icons.search_rounded,
                    color: ColorPalette.accentColor,
                    size: 22,
                  ),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
                filled: false,
              ),
            ),
          )
        ],
      ),
    );
  }
}