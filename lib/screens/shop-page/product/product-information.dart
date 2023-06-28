import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class ProductInformation extends StatefulWidget {
  static const routeName = 'ProductInformation';
  const ProductInformation({super.key});

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ActionButton(
            onClick: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: white,
              size: 10,
            ),
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/macbook.jpg"),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  'Macbook Pro - M1 chip',
                  style: TextStyle(
                    fontSize: 20,
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 5),
                    child: Text(
                      'Худалдах үнэ',
                      style: TextStyle(
                        color: grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      '5,200,000₮',
                      style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: darkGrey,
                ),
                child: Center(
                  child: Text(
                    'Null',
                    style: TextStyle(color: red, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                boxShadow: false,
                labelColor: buttonColor,
                labelText: "Худалдан авах",
                isLoading: isLoading,
                textColor: white,
                onClick: () {},
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
