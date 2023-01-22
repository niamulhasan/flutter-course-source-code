import 'package:ecom/core/constaints/my_colors.dart';
import 'package:ecom/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/cart_product_item.dart';
import '../../../../core/widgets/circle_button.dart';

class CartFragment extends StatelessWidget {
  const CartFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const _Header(),
        const _ProductsSection(),
        _BillingSection(),
      ],
    );
  }
}

class _BillingSection extends StatelessWidget {
  const _BillingSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Checkout",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: MyColors.primaryColor),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Card Number",
                fillColor: MyColors.inputBackground,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 26.0, horizontal: 18.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0.0,
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total(${cartProvider.totalItemsCount} Items)",
                      style: TextStyle(color: MyColors.primaryColor),
                    ),
                    Text(
                      "\$${cartProvider.totalPrice}",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: MyColors.primaryColor),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shipping Fee",
                    style: TextStyle(color: MyColors.primaryColor),
                  ),
                  Text(
                    "\$10",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.primaryColor),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(color: MyColors.primaryColor),
                  ),
                  Text(
                    "\$130",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.primaryColor),
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

class _ProductsSection extends StatelessWidget {
  const _ProductsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<CartProvider>(
        builder: (context, cartProvider, child) => cartProvider.items.length ==
                0
            ? Center(child: Text("No products in Cart"))
            : ListView.builder(
                itemCount: cartProvider.items.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    CartProductItem(productQuantity: cartProvider.items[index]),
              ),
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
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      sliver: SliverAppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => context.pop(),
          child: CircleButton(
              icon: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Image.asset(
              "assets/graphics/common/back_arrow.png",
              width: 14.0,
            ),
          )),
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Checkout",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: MyColors.primaryColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
