import 'package:clothes/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class CategoryClip extends StatelessWidget {
  const CategoryClip({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minWidth: 50),
        decoration: BoxDecoration(
          color: isSelected ? context.theme.primaryColor : null,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          category,
          textAlign: .center,
          style: context.textTheme.bodyMedium?.copyWith(
            color: isSelected ? Colors.white : null,
          ),
        ).paddingSymmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}
