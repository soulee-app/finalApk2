// file: restaurant_page.dart
import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/zones/Business/BG.png', // Background image asset path
              fit: BoxFit.cover,
            ),
          ),
          // Content on top of the background
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Header Section
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/zones/Business/Group 1.png', // Header image with the curved background and text
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                // Options Section (using images for buttons placed more closely)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      _buildOptionImage('assets/zones/Business/1.png',
                          width: 180, height: 30),
                      const SizedBox(
                          height: 2), // Decreased spacing between buttons
                      _buildOptionImage('assets/zones/Business/2.png',
                          width: 180, height: 30),
                      const SizedBox(height: 2),
                      _buildOptionImage('assets/zones/Business/3.png',
                          width: 180, height: 30),
                      const SizedBox(height: 2),
                      _buildOptionImage('assets/zones/Business/4.png',
                          width: 180, height: 30),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                // Switched Image Row Section with Infinity Icon in between
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSideImage(
                        'assets/zones/Business/Group 3.png',
                        width: 160,
                        height: 90,
                        isRoundLeft: false, // Right side is straight now
                      ),
                      const Icon(Icons.all_inclusive,
                          size: 28, color: Colors.grey), // Infinity Icon
                      _buildSideImage(
                        'assets/zones/Business/Group 2.png',
                        width: 160,
                        height: 90,
                        isRoundLeft: true, // Left side is straight now
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                // Tap Your Favorite Button Section
                Center(
                  child: Image.asset(
                    'assets/zones/Business/Group 4.png', // Button image asset with embedded text
                    width: 130, // Made smaller to fit the layout
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 5),

                // Map Section with Overlay
                Expanded(
                  child: Stack(
                    children: [
                      // Map Image with proper fit and alignment
                      Positioned.fill(
                        child: Image.asset(
                          'assets/zones/Business/Group 6.png', // Map image asset path
                          fit: BoxFit
                              .cover, // Cover the entire width while preserving aspect ratio
                          alignment: Alignment
                              .topCenter, // Align to show the wave properly
                        ),
                      ),
                      // Overlay "5 Miles Radius" Text
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          'assets/zones/Business/Group 5.png', // "5 Miles Radius" asset
                          width: 140,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to create option buttons using image assets with specified size
  Widget _buildOptionImage(String imagePath,
      {double width = 150, double height = 30}) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }

  // Widget to build images with one side straight and other side rounded
  Widget _buildSideImage(String imagePath,
      {double width = 140, double height = 80, bool isRoundLeft = true}) {
    return Align(
      alignment: isRoundLeft ? Alignment.centerRight : Alignment.centerLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: isRoundLeft
              ? const Radius.circular(35)
              : const Radius.circular(0),
          right: isRoundLeft
              ? const Radius.circular(0)
              : const Radius.circular(35),
        ),
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
