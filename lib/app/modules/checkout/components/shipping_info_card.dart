import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/config/theme/dark_theme_colors.dart';

import '../checkout_controller.dart';

class ShippingInfoCard extends GetView<CheckoutController> {
  const ShippingInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: InkWell(
        onTap: controller.onShippingInfoCardPressed,
        child: Container(
          height: 70.h,
          padding: EdgeInsets.all(12.sp),
          child: Row(
            children: [
              /// location icon
              Container(
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primaryContainer,

                  // color: Color(0xffe2e2e2),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: ImageIcon(
                    const AssetImage('assets/icons/gps.png'),
                    color: Get.isDarkMode ? DarkThemeColors.primaryColor : null,
                    size: 30.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              GetBuilder<CheckoutController>(
                assignId: true,
                id: 'selected_address_listener',
                builder: (controller) {
                  log('checkout shipping => isAddressChosen:  ${controller.shippingAddress == null ? 'false' : 'true'}');
                  return controller.shippingAddress == null
                      ? Text(
                          'Choose Shipping Address'.tr,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.shippingAddress!.name,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              controller.shippingAddress!.address,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 13),
                            ),
                          ],
                        );
                },
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
