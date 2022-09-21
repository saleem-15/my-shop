import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_shop/models/cart_item.dart';
import 'package:my_shop/screens/cart/components/confirm_delete_item_bottom_sheet.dart';
import 'package:my_shop/screens/cart/services/add_product_to_cart_service.dart';
import 'package:my_shop/screens/cart/services/edit_cart_item.dart';

import '../../models/product.dart';
import '../checkout/checkout_controller.dart';
import 'services/delete_cart_item.dart';
import 'services/get_all_cart_items.dart';

class CartController extends GetxController {
  double get totalCartItemsPrice {
    double sum = 0;
    for (var item in cartItems) {
      sum += item.value.totalPrice;
    }
    return sum;
  }

  RxBool isLoading = true.obs;
  RxList<Rx<CartItem>> cartItems = <Rx<CartItem>>[].obs;

  @override
  void onReady() async {
    getCartItems();

    super.onReady();
  }

  void addNewCartITem(Product product, int chosenQuantity, String selectedColorId, String? selectedSizeId) {
    // cartItems.add(item.obs);CartItem item,
    addProductToCartService(product.id, selectedColorId, selectedSizeId, chosenQuantity);
  }

  Future<void> reduceQuantityByOne(String cartItemID) async {
    final cartItem = cartItems.firstWhere((cartItem) => cartItem.value.id == cartItemID);
    if (cartItem.value.quantity == 1) {
      return;
    }

    final bool isUpdated = await decreaseQuantityByOneService(cartItem.value);

    if (isUpdated) {
      cartItem.update((item) {
        item!.quantity = item.quantity - 1;
      });
    }
  }

  Future<void> increaseQuantityByOne(String cartItemId) async {
    final cartItem = cartItems.firstWhere((cartItem) => cartItem.value.id == cartItemId);

    final bool isUpdated = await increaseQuantityByOneService(cartItem.value);

    if (isUpdated) {
      cartItem.update((item) {
        item!.quantity = item.quantity + 1;
      });
    }
  }

  showDeleteConfirmation(String productId) {
    final cartItem = cartItems.firstWhere((cartItem) => cartItem.value.id == productId);

    Get.bottomSheet(
      ConfirmDeleteItem(cartItem: cartItem.value),
      enterBottomSheetDuration: const Duration(milliseconds: 400),
    );
  }

  Future<void> deleteCartItem(CartItem cartItem) async {
    await deleteCartItemService(cartItem.id);
    getCartItems();
  }

  void checkout() {
    //pass the list of items to the checkout controller
    Get.find<CheckoutController>().setOrdersList(cartItems);

    Get.toNamed('/checkout');
  }

  Future<void> getCartItems() async {
    isLoading(true);
    final items = await getAllCartItemsService();
    isLoading(false);
    final convertedToRx = items.map((e) => e.obs);
    cartItems.clear();
    cartItems.addAll(convertedToRx);
  }

  Future<void> onRefresh() async {
    await getCartItems();
  }
}




/*
[
    CartItem(
      price: 385,
      productId: '1',
      productName: 'Wrella Cardigans',
      quantity: 1,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR6mNeolQnmtuuUJ3SwppHCm0CfRXTBECfOw&usqp=CAU',
      chosenColor: Colors.deepPurple[300]!.value,
      chosenSize: 'M',
    ).obs,
    CartItem(
      price: 385,
      productId: '2',
      productName: 'Wrella Cardigans',
      quantity: 3,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR6mNeolQnmtuuUJ3SwppHCm0CfRXTBECfOw&usqp=CAU',
      chosenColor: 0xFF46E4CC,
      chosenSize: 'S',
    ).obs,
    CartItem(
      price: 385,
      productId: '3',
      productName: 'Wrella Cardigans',
      quantity: 1,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR6mNeolQnmtuuUJ3SwppHCm0CfRXTBECfOw&usqp=CAU',
      chosenColor: 0xFF46E4CC,
      chosenSize: 'L',
    ).obs,
  ].obs
*/