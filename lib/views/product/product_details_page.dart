import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/extensions/widget_extensions.dart';
import '../../models/product_model.dart';
import 'notifiers/product_qty_notifier.dart';
import 'widgets/product_qty_selector.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late final QtyNotifierHandler qtyHandler;

  @override
  void initState() {
    qtyHandler = QtyNotifierHandler();
    super.initState();
  }

  @override
  void dispose() {
    qtyHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      // -=============
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // surfaceTintColor: Colors.transparent,

        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
      ),

      // -=============
      body: CustomScrollView(
        slivers: [
          // felxable product image
          SliverPersistentHeader(
            delegate: ProductImageHeaderDelegate(
              context,
              product: widget.product,
            ),
          ),
          // Product Detalis
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(widget.product.category),
              subtitle: Text(widget.product.name),
            ),
          ).sliverPaddingSymmetric(horizontal: 20),
          //Qty Selector
          SliverToBoxAdapter(
            child: Row(
              children: [
                ListenableBuilder(
                  listenable: qtyHandler,
                  builder: (context, _) => ProductQtySelector(
                    qty: qtyHandler.qty,
                    onChange: qtyHandler.setQty,
                  ),
                ),
                Text(
                  '${widget.product.price} EGP',
                  textAlign: .end,
                  style: context.theme.textTheme.titleLarge,
                ).expanded(),
              ],
            ),
          ).sliverPaddingAll(10),

          // Product Description
          SliverToBoxAdapter(
            child: Text(
              widget.product.decription,
              style: context.theme.textTheme.labelLarge,
              textAlign: .center,
            ),
          ).sliverPaddingSymmetric(horizontal: 20),

          // handle open sheet case -> avoid ovelapping
          SliverToBoxAdapter(child: SizedBox(height: 120)).sliverPaddingAll(10),
        ],
      ),
      // -=============
      bottomSheet: ListenableBuilder(
        listenable: qtyHandler,
        builder: (BuildContext context, _) => qtyHandler.qty < 1
            ? SizedBox()
            : Container(
                padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 20,
                  bottom: 40,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    maximumSize: Size(context.screenWidth, 60),
                    minimumSize: Size(context.screenWidth, 60),
                  ),
                  child: Text(
                    'Confirm ${qtyHandler.qty * widget.product.price} EGP',
                  ),
                ),
              ),
      ),
    );
  }
}

class ProductImageHeaderDelegate extends SliverPersistentHeaderDelegate {
  ProductImageHeaderDelegate(this.context, {required this.product});
  final Product product;
  final BuildContext context;

  @override
  double get minExtent => kToolbarHeight;

  @override
  double get maxExtent => context.screenHeight * .6;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Hero(
      tag: product.id,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        child: Image.asset(product.image, fit: .cover),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
