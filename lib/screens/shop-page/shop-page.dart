import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Lottie.asset(
              'assets/lottie/empty.json',
              height: 150,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Тун удахгүй...',
              style: TextStyle(
                color: white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
