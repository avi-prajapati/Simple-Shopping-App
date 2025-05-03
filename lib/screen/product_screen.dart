import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../custom_ui/product_ card.dart';
import '../model/product.dart';
import '../provider/data_providers.dart';
import 'open_shopping_cart.dart';

late Size mq;

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  //List of the Product.
  final List<Product> productlist = [
    Product(title: 'Teddy', subtitle: '200', image: 'cute.png'),
    Product(title: 'Fast Food', subtitle: '180', image: 'fast-food.png'),
    Product(title: 'Guitar', subtitle: '2000', image: 'guitar.png'),
    Product(title: 'Burger', subtitle: '100', image: 'hamburger.png'),
    Product(title: 'RC Car', subtitle: '499', image: 'rc-car.png'),
    Product(title: 'Rubik Cube', subtitle: '150', image: 'rubik.png'),
    Product(title: 'Sandal', subtitle: '199', image: 'sandals.png'),
    Product(title: 'Unicorn', subtitle: '200', image: 'unicorn.png')
  ];

  @override
  Widget build(BuildContext context) {
    //Getting Device Size.
    mq = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => DataProviders(),
      child: Consumer<DataProviders>(
        builder: (context, value, child) => Scaffold(
          //App Bar title
          appBar: AppBar(
            title: const Text(
              'Budget Shopping',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            centerTitle: true,
            backgroundColor: Colors.amber[600],
            leading: const Icon(CupertinoIcons.home),

            //App Bar Icon Button.
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  tooltip: 'Open shopping cart',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OpenShoppingCart(
                                productlist: productlist
                                    .where((element) => element.isAdded == true)
                                    .toList()))).then((value) {
                      setState(() {
                        productlist;
                      });
                    });
                  }),
            ],
          ),

          //Floating Action Button
          floatingActionButton: SizedBox(
            width: mq.width * .5,
            height: mq.height * .13,
            child: Stack(
              alignment: Alignment.center,
              children: [
                FloatingActionButton.extended(
                  backgroundColor: Colors.amber[600],
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OpenShoppingCart(
                                productlist: productlist
                                    .where((element) => element.isAdded == true)
                                    .toList()))).then((value) {
                      setState(() {
                        productlist;
                      });
                    });
                  },
                  label: const Text('Open Cart'),
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),

                //Material button to show count of item added in the cart.
                Positioned(
                  top: 0,
                  right: mq.width * .025,
                  // top: 0,
                  // right: 0,

                  child: MaterialButton(
                    onPressed: () {},
                    elevation: 0,
                    shape: CircleBorder(),
                    minWidth: 0,
                    padding: EdgeInsets.all(10),
                    color: Color.fromARGB(255, 235, 19, 4),

                    //Text of the selected item count.

                    //This method implement by provider and for now we are commenting it.
                    // child: Text('${value.itemCount}',
                    child: Text(
                        '${productlist.where(
                              (element) => element.isAdded,
                            ).length}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                  ),
                )
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,

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

          //Body of the ListView Builder Example.
          body: ListView.builder(
              itemCount: productlist.length,
              itemBuilder: (context, i) {
                return ProductCard(
                  product: productlist[i],

                  /*We are Commenting that countItem function because we are using 
                  Providers*/
                  countItem: () {
                    setState(() {});
                  },
                );
              }),
        ),
      ),
    );
  }
}
