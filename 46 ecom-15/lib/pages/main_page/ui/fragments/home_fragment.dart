import 'package:ecom/core/constaints/my_colors.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/pages/main_page/providers/home_fragment_provider.dart';
import 'package:ecom/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/my_app_bar.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeFragmentProvider(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: MyAppBar()),
              const _SearchBox(),
              const _CategoriesTab(),
              SliverToBoxAdapter(
                child: Consumer<HomeFragmentProvider>(
                    builder: (context, homeFragmentProvider, child) {
                  List<ProductModel> products = homeFragmentProvider.products;
                  return homeFragmentProvider.isProductLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: MyColors.primaryColor,
                        ))
                      : GridView.builder(
                          itemCount: products.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 12.0,
                            childAspectRatio: 3 / 7,
                          ),
                          itemBuilder: (context, index) => ProductCard(
                            onTap: () {
                              print("boo");
                              context.goNamed(RouteNames.DETAILS,
                                  extra: products[index]);
                            },
                            title: (products[index].title!.length > 20
                                    ? "${products[index].title!.substring(0, 20)}..."
                                    : products[index].title) ??
                                "No Title",
                            image: products[index].image ??
                                "https://picsum.photos/200/300",
                            category: products[index].category ?? "No Category",
                            price: "\$${products[index].price.toString()}",
                            stars: "5.0",
                          ),
                        );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String image;
  final String category;
  final String price;
  final String stars;
  final VoidCallback? onTap;
  const ProductCard({
    Key? key,
    required this.title,
    required this.image,
    required this.category,
    required this.price,
    required this.stars,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const CircleAvatar(
                      backgroundColor: MyColors.primaryColor,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    )),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: Colors.purple,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(image),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    category,
                    style: const TextStyle(
                        fontSize: 12.0, color: MyColors.secondaryColor),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/graphics/common/star.png",
                            width: 28,
                          ),
                          Text(
                            stars,
                            style: const TextStyle(fontSize: 18.0),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CategoriesTab extends StatelessWidget {
  const _CategoriesTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        height: 90.0,
        child: Consumer<HomeFragmentProvider>(
          builder: (context, homeFragmentProvider, child) =>
              homeFragmentProvider.isCategoriesLoading
                  ? Center(
                      child: CircularProgressIndicator(
                          color: MyColors.primaryColor))
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeFragmentProvider.categories.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => homeFragmentProvider
                            .changeProductCategoryTab(index),
                        child: CategoryTab(
                          icon: "assets/graphics/common/icon_cat_all.png",
                          title: homeFragmentProvider.categories[index]
                              .toString()
                              .toUpperCase(),
                          isSelected:
                              index == homeFragmentProvider.selectedTabIndex,
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;
  const CategoryTab(
      {Key? key,
      required this.icon,
      required this.title,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12.0),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 18.w,
            color: isSelected ? Colors.white : MyColors.primaryColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyle(
                color: isSelected ? Colors.white : MyColors.primaryColor),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: isSelected ? MyColors.primaryColor : Colors.white,
          border: Border.all(color: MyColors.inputBorder)),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/graphics/common/search_icon.png",
                width: 24.w,
              ),
            ),
            hintText: "Search Products",
            hintStyle: const TextStyle(color: MyColors.inputHint),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffEDEDED),
                ),
                borderRadius: BorderRadius.circular(12.r)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                color: MyColors.inputBorder,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
