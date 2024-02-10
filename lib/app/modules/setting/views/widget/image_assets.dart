import 'package:flutter/material.dart';

class ImagesAssets extends StatelessWidget {
  const ImagesAssets({
    super.key,
    required this.height,
    required this.asset,
  });

  final double? height;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Image.asset(asset,
        width: MediaQuery.of(context).size.width - 32,
        height: height ?? 210,
        fit: BoxFit.cover);
  }
}
