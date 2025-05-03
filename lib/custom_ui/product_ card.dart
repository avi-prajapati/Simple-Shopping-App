import 'package:provider/provider.dart';

import '../model/product.dart';
import '../provider/data_providers.dart';
import '../screen/product_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key, required this.product, required this.countItem});

  final Product product;
  final VoidCallback countItem;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    //Commenting this line because its showing some error while counting a product.
    // DataProviders data = Provider.of<DataProviders>(context);

    //Card View of Shopping.
    return Card(
      //Change Card Color according to the item is added in the cart or not.
      color: widget.product.isAdded ? Colors.green[50] : null,

      //Creating Round Card.
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: mq.height * .01),

      //ListTile of Product.
      child: ListTile(
        contentPadding: EdgeInsets.only(
            left: mq.width * .05,
            right: mq.width * .02,
            top: mq.height * .02,
            bottom: mq.height * .02),

        //Image of the Product Cart.
        leading: Image.asset('assets/images/${widget.product.image}'),

        //Title of the Product Cart.
        title: Text(widget.product.title),

        //Subtitle of the Product Cart.
        subtitle: Text('₹ ${widget.product.subtitle}'),

        //Here condition is there to show green tick or not.
        trailing: widget.product.isAdded
            //Icon Button in Card View.
            ? IconButton(
                onPressed: () {
                  //Calling decrementCount function commenting due to some error..
                  // data.decrementCount();

                  //Calling this function to count the selected item.
                  widget.countItem();

                  //remove item from the Card View.
                  setState(() {
                    widget.product.isAdded = false;
                  });

                  //Show SnackBar of removing item from the Card View.
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text(
                      'Item Removed From Cart',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.amber[600],
                    duration: const Duration(seconds: 1),
                  ));
                },
                icon: Image.asset('assets/images/check.png'))

            //Elevated Button in Card View
            : ElevatedButton.icon(
                onPressed: () {
                  //Calling incrementCount function commenting due to some error.
                  // data.incrementCount();

                  //Calling this function to count the selected item.
                  widget.countItem();

                  //Add item to Shopping card when button is pressed.
                  setState(() {
                    widget.product.isAdded = true;
                  });

                  //This Show Snackbar of Successfully item added.
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text(
                      'Item Added Successfully',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.amber[600],
                    duration: const Duration(seconds: 1),
                  ));
                },

                //label of Elevated button.
                label: const Text(
                  'Add',
                  style: TextStyle(color: Colors.black),
                ),

                //Style of the Elevated Button.
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.amber[600]),

                //Icon of the Elevated Button.
                icon: const Icon(
                  Icons.shopping_cart_checkout_rounded,
                  color: Colors.black,
                ),
              ),
      ),
    );
  }
}
