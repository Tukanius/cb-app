import 'dart:async';

import 'package:bank_core/api/auth-api.dart';
import 'package:bank_core/components/active-loan-card/active-loan-card.dart';
import 'package:bank_core/components/potential-balance-card/potential-balance-card.dart';
import 'package:bank_core/models/get.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/loan-detail-page/loan-detail-page.dart';
import 'package:bank_core/screens/loan-page/loan-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:after_layout/after_layout.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePageArguments {
  String id;
  HomePageArguments({
    required this.id,
  });
}

class HomePage extends StatefulWidget {
  // final String id;
  const HomePage({
    Key? key,
    // required this.id,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  bool isLoading = true;

  @override
  afterFirstLayout(BuildContext context) async {
    get = await AuthApi().accountGet(user.customerId!);
    setState(() {
      isLoading = false;
    });
  }

  Get get = Get();
  User user = User();

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: true).user;

    return isLoading == true
        ? Center(
            child: CircularProgressIndicator(
              color: buttonColor,
            ),
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, bottom: 15, top: 40),
                  child: Text(
                    'Дижитал зээл',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                PotentialBalanceCard(
                  slider: false,
                  data: get,
                  onClick: () {
                    Navigator.of(context).pushNamed(LoanPage.routeName);
                  },
                ),
                //     ],
                //   ),
                // ),

                Container(
                  margin: const EdgeInsets.only(left: 15, bottom: 20, top: 40),
                  child: Text(
                    'Идэвхтэй зээл',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ActiveLoanCard(
                        onClick: () {
                          Navigator.of(context)
                              .pushNamed(LoanDetailPage.routeName);
                        },
                      ),
                      ActiveLoanCard(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(),
                  height: 160,
                  width: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: NetworkImage(
                          'https://officebanao.com/wp-content/uploads/2022/10/Modern-office-design-5-1024x576.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
