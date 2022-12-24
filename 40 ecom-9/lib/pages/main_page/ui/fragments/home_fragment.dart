import 'package:ecom/core/constaints/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/my_app_bar.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: MyAppBar()),
            _SearchBox(),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                height: 90.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => CategoryTab(
                    icon: "assets/graphics/common/icon_cat_all.png",
                    title: "Category $index",
                    isSelected: index == 1,
                  ),
                ),
              ),
            )
          ],
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
      width: 120.0,
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 18.w,
            color: isSelected ? Colors.white : MyColors.primaryColor,
          ),
          SizedBox(
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
            hintStyle: TextStyle(color: MyColors.inputHint),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffEDEDED),
                ),
                borderRadius: BorderRadius.circular(12.r)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: MyColors.inputBorder,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
