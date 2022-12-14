import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/order_item.dart';
import '../../orders/controllers/completed_orders_controller.dart';

class OrderItemTile extends GetView<CompletedOrdersController> {
  const OrderItemTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderItem order;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: InkWell(
        onTap: () {
          // controller.trackOrder(order.orderId);
        },
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  'assets/3.jpg',
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
                          order.productName,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        OrderInfo(orderItem: order),

                        /// status banner
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.sp, vertical: 5.sp),
                          decoration: BoxDecoration(
                            // color: lightGrey,
                            color: Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(order.status.name.tr),
                        ),
                        Text(
                          '\$${order.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OrderInfo extends StatelessWidget {
  const OrderInfo({
    Key? key,
    required this.orderItem,
  }) : super(key: key);

  final OrderItem orderItem;
  final divider = ' | ';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (orderItem.chosenColor != null)
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(orderItem.chosenColor!),
                radius: 8.r,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text('Color'.tr),
            ],
          ),
        if (orderItem.chosenColor != null && orderItem.chosenSize != null) Text(divider),
        if (orderItem.chosenSize != null) Text('${'Size'.tr} = ${orderItem.chosenSize!}'),
        if (orderItem.chosenColor != null) Text(divider),
        Text('Qty = ${orderItem.quantity}'),
      ],
    );
  }
}
