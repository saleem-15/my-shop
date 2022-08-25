import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product_preview.dart';

class HomeController extends GetxController{

    final TextEditingController searchController = TextEditingController();


    final categories = [
      'Clothes',
      'Shoes',
      'Electronics',
      'Toys',
      'Watch',
      'Kitchen',
    ];
    final isSelected = [
      false.obs,
      false.obs,
      false.obs,
      false.obs,
      false.obs,
      false.obs,
    ];


     final List<ProductPreview> productsPreview = [
      ProductPreview(
        id: '1',
        image: 'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
        isFavorite: false,
        name: 'Cotton sweatshirt',
        price: 45.99,
      ),
      ProductPreview(
        id: '2',
        image: 'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        isFavorite: false,
        name: 'Cotton sweatshirt',
        price: 45.99,
      ),
      ProductPreview(
        id: '3',
        image: 'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
        isFavorite: false,
        name: 'Cotton sweatshirt',
        price: 69.99,
      ),
      ProductPreview(
        id: '4',
        image:
            'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
        isFavorite: false,
        name: 'Woman',
        price: 999.99,
      ),
      ProductPreview(
        id: '5',
        image: 'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
        isFavorite: false,
        name: 'Cotton sweatshirt',
        price: 27.99,
      ),
      ProductPreview(
        id: '8',
        image: 'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
        isFavorite: true,
        name: 'Cotton sweatshirt',
        price: 100,
      ),
      ProductPreview(
        id: '9',
        image: 'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
        isFavorite: false,
        name: 'Cotton sweatshirt',
        price: 27.99,
      ),
      ProductPreview(
        id: '10',
        image: 'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
        isFavorite: false,
        name: 'Cotton sweatshirt',
        price: 27.99,
      ),
      ProductPreview(
        id: '11',
        image: 'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
        isFavorite: false,
        name: 'Cotton sweatshirt',
        price: 27.99,
      ),
    ];

}