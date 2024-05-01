import 'package:flutter/material.dart';

class ImagesAssets extends StatelessWidget {
  const ImagesAssets({
    super.key,
    required this.asset,

  });

  final String asset;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate a suitable height based on screen width
        double imageHeight = constraints.maxWidth * 0.8; // Adjust this factor as per your requirement

        // Adjust height for landscape mode if needed
        if (MediaQuery.of(context).orientation == Orientation.landscape) {
          imageHeight *= 0.7; // Adjust this factor as per your requirement
        }

        return Image.asset(
          asset,
          width: constraints.maxWidth, // Take full width available
          height: imageHeight,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
