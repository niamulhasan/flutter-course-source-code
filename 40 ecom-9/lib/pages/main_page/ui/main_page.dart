import 'package:ecom/core/constaints/asset_locations.dart';
import 'package:ecom/core/constaints/my_colors.dart';
import 'package:ecom/pages/main_page/providers/main_page_provider.dart';
import 'package:ecom/pages/main_page/ui/fragments/cart_fragment.dart';
import 'package:ecom/pages/main_page/ui/fragments/home_fragment.dart';
import 'package:ecom/pages/main_page/ui/fragments/wish_list_fragment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainPageProvider(),
      builder: (context, child) => Scaffold(
        body: Consumer<MainPageProvider>(
          builder: (context, mainPageProvider, child) {
            if (mainPageProvider.getSelectedTabIndex() == 0) {
              return HomeFragment();
            }
            if (mainPageProvider.getSelectedTabIndex() == 1) {
              return CartFragment();
            }
            if (mainPageProvider.getSelectedTabIndex() == 2) {
              return WishListFragment();
            }
            return Center(child: Text("No Fragment Selected"));
          },
        ),
        bottomNavigationBar: Consumer<MainPageProvider>(
          builder: (context, mainPageProvider, child) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: MyColors.primaryColor),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: mainPageProvider.getSelectedTabIndex(),
                  onTap: (index) => mainPageProvider.setTab(index),
                  items: [
                    BottomNavigationBarItem(
                        icon: SizedBox(
                            width: 44.0,
                            height: 44.0,
                            child: Image.asset(AssetLocations.HOME_ICON)),
                        label: "Home"),
                    BottomNavigationBarItem(
                        icon: SizedBox(
                            width: 44.0,
                            height: 44.0,
                            child: Image.asset(AssetLocations.CART_ICON)),
                        label: "Cart"),
                    BottomNavigationBarItem(
                        icon: SizedBox(
                            width: 44.0,
                            height: 44.0,
                            child: Image.asset(AssetLocations.WISHLIST_ICON)),
                        label: "Wish List"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
