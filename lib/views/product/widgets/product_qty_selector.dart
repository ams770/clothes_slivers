import 'dart:math';

import 'package:clothes/core/extensions/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductQtySelector extends StatelessWidget {
  const ProductQtySelector({
    super.key,
    required this.qty,
    required this.onChange,
  });
  final int qty;
  final void Function(int value) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => onChange(max(0, qty - 1)),
          icon: Icon(CupertinoIcons.minus),
        ),
        Text(
          qty.toString(),
          style: context.textTheme.headlineSmall,
        ).paddingSymmetric(horizontal: 8),
        IconButton(
          onPressed: () => onChange(qty + 1),
          icon: Icon(CupertinoIcons.add),
        ),
      ],
    );
  }
}
