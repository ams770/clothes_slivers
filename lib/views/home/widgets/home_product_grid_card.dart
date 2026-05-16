import 'package:flutter/material.dart';

import '../../../core/extensions/widget_extensions.dart';
import '../../../models/product_model.dart';

class HomeProductGridCard extends StatelessWidget {
  const HomeProductGridCard({super.key, required this.product, this.onTap});
  final Product product;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Hero(
            tag: product.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                product.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ).expanded(),

          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyMedium,
              ),
              Text(
                '${product.price} EGP',
                style: context.textTheme.titleMedium,
              ),
            ],
          ).paddingSymmetric(horizontal: 8),
        ],
      ),
    );
  }
}
