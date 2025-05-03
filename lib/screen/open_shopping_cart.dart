import 'package:budget_shopping_app/model/product.dart';
import 'package:flutter/material.dart';

import '../custom_ui/product_ card.dart';

class OpenShoppingCart extends StatelessWidget {
  const OpenShoppingCart({super.key, required this.productlist});

  final List<Product> productlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar title
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber[600],
      ),

      //Body of the ListView Example
      // body: ListView(
      //   children: const [
      //     ProductCard(),
      //     ProductCard(),
      //     ProductCard(),
      //     ProductCard(),
      //     ProductCard(),
      //   ],
      // ),

      // Body of the ListView Builder Example.
      body: ListView.builder(
          itemCount: productlist.length,
          itemBuilder: (context, i) {
            return ProductCard(
              product: productlist[i],

              /*We are Commenting that countItem function because we are using 
              Providers*/
              countItem: () {
                setState() {
                  productlist;
                }
              },
            );
          }),
    );
  }
}
