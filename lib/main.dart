import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/data_providers.dart';
import 'screen/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Budget Shopping',
        home: ProductScreen());

    //Commenting this Provider feature because it showing some error.
    // return ChangeNotifierProvider(
    //   create: (context) => DataProviders(),
    //   child: const MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       title: 'Budget Shopping',
    //       home: ProductScreen()),
    // );
  }
}
