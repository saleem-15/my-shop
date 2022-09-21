import 'package:get/get.dart';
import 'package:my_shop/screens/product/product_controller.dart';

class ProductBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
