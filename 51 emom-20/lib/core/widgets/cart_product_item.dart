import 'package:ecom/core/constaints/my_colors.dart';
import 'package:ecom/models/product_quantity_model.dart';
import 'package:ecom/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartProductItem extends StatelessWidget {
  final ProductQuantityModel productQuantity;
  const CartProductItem({
    Key? key,
    required this.productQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
      padding: const EdgeInsets.only(bottom: 18.0),
      width: double.infinity,
      decoration: const BoxDecoration(
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
                      image: NetworkImage(productQuantity.product.image ??
                          "https://picsum.photos/200"))),
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
                    productQuantity.product.title ?? "No title availabe",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: MyColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      productQuantity.product.category ?? "No category",
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: MyColors.secondaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "\$${productQuantity.product.price}",
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
                    onTap: () =>
                        Provider.of<CartProvider>(context, listen: false)
                            .addProduct(productQuantity.product),
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            bottomLeft: Radius.circular(8.r)),
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
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
                    child: Consumer<CartProvider>(
                      builder: (context, cartProvider, child) => Text(
                        productQuantity.quantity.toString(),
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () =>
                        Provider.of<CartProvider>(context, listen: false)
                            .removeProduct(productQuantity.product),
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
