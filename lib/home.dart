import 'package:e_commerce_app/supplemental/asymmetric_view.dart';
import 'package:flutter/material.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return  AsymmetricView(products: ProductsRepository.loadProducts(Category.all));
  }
}