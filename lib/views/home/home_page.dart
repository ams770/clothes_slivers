import 'package:clothes/views/product/product_details_page.dart';
import 'package:flutter/material.dart';

import '../../controllers/product_controller.dart';
import '../../core/extensions/widget_extensions.dart';
import 'widgets/category_clip.dart';
import 'widgets/home_banner.dart';
import 'widgets/home_product_grid_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = DataController();
  @override
  void initState() {
    super.initState();
    controller.fetchProducts();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: .6,
                ),
                itemCount: controller.products.length,

                itemBuilder: (context, index) {
                  return HomeProductGridCard(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          product: controller.products[index],
                        ),
                      ),
                    ),
                    product: controller.products[index],
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
