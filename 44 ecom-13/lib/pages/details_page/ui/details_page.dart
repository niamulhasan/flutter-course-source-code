import 'package:ecom/core/constaints/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _Header(),
              _Title(),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24),
                child: Text(
                  "Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes",
                  style: TextStyle(fontSize: 16.sp, color: MyColors.inputHint),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: SizedBox(
            width: double.infinity,
            height: 56.h,
            child: ElevatedButton(
              onPressed: () async {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.r))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/graphics/common/cart.png",
                    width: 32.0,
                  ),
                  SizedBox(width: 12.0),
                  Text(
                    "Add to Cart | \$100.99",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Text(
                    "\$190.99",
                    style: TextStyle(
                        fontSize: 10.sp,
                        decoration: TextDecoration.lineThrough),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Modern light clothes",
              style: TextStyle(fontSize: 24.h, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: MyColors.borderColor)),
                  child: Icon(
                    Icons.remove,
                    color: MyColors.secondaryColor,
                  ),
                ),
                Text(
                  "1",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: MyColors.borderColor)),
                  child: Icon(
                    Icons.add,
                    color: MyColors.primaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24),
          width: double.infinity,
          height: 400.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("https://picsum.photos/200"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 38.0, horizontal: 44),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => context.pop(),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/graphics/common/back_arrow.png",
                    width: 14.0,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: Image.asset(
                  "assets/graphics/common/heart.png",
                  width: 28.0,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
