import 'package:bank_core/screens/shop-page/product/product-information.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatefulWidget {
  static const routeName = 'ProductContainer';
  const ProductContainer({super.key});

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductInformation.routeName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: 185,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: darkGrey,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/macbook.jpg"),
                    ),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/logo.jpg"),
                      ),
                    ),
                    width: 45,
                    height: 45,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Macbook Pro - M1 chip',
                    style: TextStyle(color: white, fontSize: 15),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Зөөврийн компьютер',
                        style: TextStyle(color: grey, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        '5,200,000₮',
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
