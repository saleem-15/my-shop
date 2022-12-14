import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers.dart';
import '../../../models/cart_item.dart';
import '../../../shared/item_info.dart';
import '../checkout_controller.dart';
import '/config/theme/light_theme_colors.dart';

class CheckoutItem extends GetView<CheckoutController> {
  const CheckoutItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                getFullImageUrl(cartItem.imageUrl),
                fit: BoxFit.cover,
                width: 100.sp,
                height: 100.sp,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 12.sp),
                child: SizedBox(
                  height: 100.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        cartItem.productName,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      ItemInfo(cartItem: cartItem),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${cartItem.price}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 18),
                          ),
                          CircleAvatar(
                            backgroundColor: lightGrey,
                            radius: 13.sp,
                            child: Text(
                              '${cartItem.quantity}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      )
                    ],
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
