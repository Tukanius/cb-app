import 'package:bank_core/screens/shop-page/product/product-container.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  ProductContainer(),
                  ProductContainer(),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  ProductContainer(),
                  ProductContainer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
