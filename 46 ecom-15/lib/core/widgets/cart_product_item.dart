import 'package:ecom/core/constaints/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
      padding: const EdgeInsets.only(bottom: 18.0),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: MyColors.inputBorder))),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://picsum.photos/200"))),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Modern light clothes",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: MyColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Dress Modern",
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: MyColors.secondaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "\$120",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: MyColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            bottomLeft: Radius.circular(8.r)),
                      ),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 24,
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                    ),
                    child: Text(
                      "1",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: MyColors.primaryColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.r),
                              bottomRight: Radius.circular(8.r))),
                      child: Icon(Icons.remove, color: Colors.white),
                    ),
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
