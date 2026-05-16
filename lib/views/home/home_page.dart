import 'package:clothes/views/product/product_details_page.dart';
import 'package:flutter/material.dart';

import '../../controllers/product_controller.dart';
import '../../core/extensions/widget_extensions.dart';
import '../../models/product_model.dart';
import 'widgets/category_clip.dart';
import 'widgets/home_banner.dart';
import 'widgets/home_product_grid_card.dart';
import 'widgets/home_product_list_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DataController controller;

  @override
  void initState() {
    controller = DataController();
    controller.fetchProducts();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _navigateToProduct(Product product) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return CustomScrollView(
            slivers: [
              // Home Banner
              SliverSafeArea(
                bottom: false,
                sliver:
                    SliverToBoxAdapter(
                          child: HomeBanner(
                            title: 'the most popular clothes today',
                            offer: '50%\noff',
                          ),
                        )
                        .sliverPaddingSymmetric(horizontal: 20)
                        .sliverPaddingOnly(top: 20),
              ),

              // Categories
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 70,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categories.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemBuilder: (context, index) => Align(
                      child: CategoryClip(
                        category: controller.categories[index],
                        isSelected:
                            controller.selectedCategory ==
                            controller.categories[index],
                        onTap: () => controller.selectCategory(
                          controller.categories[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Products Grid
              SliverToBoxAdapter(
                child: Text(
                  'Products Grid',
                  style: context.textTheme.headlineSmall,
                ).paddingSymmetric(horizontal: 20, vertical: 10),
              ),

              SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: .6,
                        ),
                    itemCount: controller.gridProducts.length,

                    itemBuilder: (context, index) {
                      return HomeProductGridCard(
                        product: controller.gridProducts[index],
                        onTap: () =>
                            _navigateToProduct(controller.gridProducts[index]),
                      );
                    },
                  )
                  .sliverPaddingSymmetric(horizontal: 20)
                  .sliverPaddingOnly(bottom: 20),

              // Products list
              SliverToBoxAdapter(
                child: Text(
                  'Products List',
                  style: context.textTheme.headlineSmall,
                ).paddingSymmetric(horizontal: 20, vertical: 10),
              ),
              SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 5,
                ),
                itemCount: controller.listProducts.length,

                itemBuilder: (context, index) {
                  return HomeProductListCard(
                    product: controller.listProducts[index],
                    onTap: () =>
                        _navigateToProduct(controller.listProducts[index]),
                  );
                },
              ).sliverPaddingSymmetric(horizontal: 20),

              // Safe Area Spacer
              SliverSafeArea(
                top: false,
                sliver: SliverToBoxAdapter().sliverPaddingOnly(bottom: 20),
              ),
            ],
          );
        },
      ),
    );
  }
}
