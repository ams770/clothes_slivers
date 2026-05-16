import 'package:flutter/material.dart';
import 'package:clothes/core/utils/app_assets.dart';

import '../../../core/extensions/widget_extensions.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
    required this.title,
    required this.offer,
    this.height = 100,
  });
  final String title;
  final String offer;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(AppAssets.banner),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            textAlign: .start,
            style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
          ).expanded(flex: 1),
          const SizedBox(width: 5),
          Text(
            offer,
            textAlign: .center,
            style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
          ).expanded(),
        ],
      ),
    );
  }
}
