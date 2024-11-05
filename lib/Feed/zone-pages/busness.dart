import 'package:flutter/material.dart';
import 'package:navbar/Feed/zone-pages/restaurant_page.dart';

class Business extends StatelessWidget {
  const Business({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Left Column with three smaller images stacked vertically
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: _buildImageButton(
                      context,
                      'assets/zones/Business/Restaurant.png',
                      'RESTAURANT',
                      const RestaurantPage(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: _buildImageButton(
                      context,
                      'assets/zones/Business/Content.png',
                      'CONTENT',
                      const ContentPage(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: _buildImageButton(
                      context,
                      'assets/zones/Business/Jewelry.png',
                      'JEWELRY',
                      const JewelryPage(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Right Column with two larger images stacked vertically
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: _buildImageButton(
                      context,
                      'assets/zones/Business/Gadget.png',
                      'GADGETS',
                      const GadgetsPage(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: _buildImageButton(
                      context,
                      'assets/zones/Business/Vehicles.png',
                      'VEHICLE',
                      const VehiclesPage(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageButton(
    BuildContext context,
    String imagePath,
    String label,
    Widget page,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Stack(
          children: [
            // Reduced image size to make space for the label
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 15.0), // Create space for the button
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Positioned text at the bottom-right, half inside and half outside the image
            Positioned(
              bottom: -10, // Slightly below the image
              right: -10, // Slightly to the right of the image
              child: Container(
                color: Colors.redAccent,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
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

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is the Content Page'),
      ),
    );
  }
}

class GadgetsPage extends StatelessWidget {
  const GadgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is the Gadgets Page'),
      ),
    );
  }
}

class JewelryPage extends StatelessWidget {
  const JewelryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is the Jewelry Page'),
      ),
    );
  }
}

class VehiclesPage extends StatelessWidget {
  const VehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is the Vehicles Page'),
      ),
    );
  }
}
