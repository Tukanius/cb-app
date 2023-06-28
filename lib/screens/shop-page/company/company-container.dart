import 'package:bank_core/screens/shop-page/company/company-information.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class CompanyContainer extends StatefulWidget {
  const CompanyContainer({super.key});

  @override
  State<CompanyContainer> createState() => _CompanyContainerState();
}

class _CompanyContainerState extends State<CompanyContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CompanyInformation.routeName);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        width: 125,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white,
        ),
        child: Column(
          children: [
            Container(
              width: 125,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/logo.jpg"),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Apple',
                    style: TextStyle(
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
