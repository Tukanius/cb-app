import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/get.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/bonus-credit/add-fiends/add-friend.dart';
import 'package:bank_core/screens/bonus-credit/facebook-auth.dart';
import 'package:bank_core/screens/profile-page/profile-detail-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:after_layout/after_layout.dart';

class BonusCredit extends StatefulWidget {
  static const routeName = 'BonusCredit';
  final Customer? customer;
  const BonusCredit({Key? key, this.customer}) : super(key: key);

  @override
  State<BonusCredit> createState() => _BonusCreditState();
}

class _BonusCreditState extends State<BonusCredit> with AfterLayoutMixin {
  bool isLoading = false;
  Get get = Get();
  Customer customer = Customer();
  User user = User();

  afterFirstLayout(BuildContext context) {
    print(isLoading);
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: true).user;
    int currentStep =
        Provider.of<UserProvider>(context, listen: false).currentStep;
    int totalSteps =
        Provider.of<UserProvider>(context, listen: false).totalSteps;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ActionButton(
            onClick: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).hoverColor,
              size: 10,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Бонус оноо',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).splashColor,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Бонус оноо',
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).iconTheme.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '$currentStep/$totalSteps',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).iconTheme.color),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: StepProgressIndicator(
                            totalSteps:
                                Provider.of<UserProvider>(context).totalSteps,
                            currentStep:
                                Provider.of<UserProvider>(context).currentStep,
                            selectedColor: Colors.red.shade600,
                            unselectedColor: darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 25),
                    child: CustomButton(
                      labelColor: buttonColor,
                      labelText: 'Түвшин ахиулах',
                      boxShadow: true,
                      onClick: () {
                        Provider.of<UserProvider>(context, listen: false)
                            .currentStep += 1;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).splashColor,
              ),
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 45),
                        child: Text(
                          'Зээлийн эрх',
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        // margin:
                        //     EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: SliderTheme(
                                data: SliderThemeData(
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 3),
                                  tickMarkShape: RoundSliderTickMarkShape(
                                      tickMarkRadius: 0),
                                ),
                                child: Slider(
                                  min: 0,
                                  max: 10,
                                  thumbColor: white,
                                  divisions: 10,
                                  activeColor: Theme.of(context).canvasColor,
                                  inactiveColor: Theme.of(context).shadowColor,
                                  label: '0',
                                  value: 1,
                                  onChanged: (double value) {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '0₮',
                              style: TextStyle(
                                color: Theme.of(context).disabledColor,
                              ),
                            ),
                            Text(
                              '${customer.balance}₮',
                              style: TextStyle(
                                  color: Theme.of(context).disabledColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 25, bottom: 4, top: 10),
                  child: Text(
                    'Оноо цуглуулах боломжууд',
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.of(context).pushNamed(AddFriends.routeName);
                      } else if (index == 1) {
                        Navigator.of(context)
                            .pushNamed(ProfileDetailPage.routeName);
                      } else if (index == 2) {
                        Navigator.of(context)
                            .pushNamed(UserFaceBookAuth.routeName);
                      }
                    },
                    child: index == 0
                        ? Container(
                            height: 180,
                            width: 150,
                            margin: EdgeInsets.only(left: 20, top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Theme.of(context).splashColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 15),
                                      child: SvgPicture.asset(
                                        'assets/svg/add-user.svg',
                                        color:
                                            Theme.of(context).iconTheme.color,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Найзаа урих',
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    '10 оноо',
                                    style: TextStyle(color: red, fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : index == 1
                            ? Container(
                                height: 180,
                                width: 150,
                                margin: EdgeInsets.only(left: 10, top: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Theme.of(context).splashColor,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          child: SvgPicture.asset(
                                            'assets/svg/user-check.svg',
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Бүртгэл',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          'баталгаажуулах',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: Text(
                                        '10 оноо',
                                        style:
                                            TextStyle(color: red, fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : index == 2
                                ? Container(
                                    height: 180,
                                    width: 150,
                                    margin: EdgeInsets.only(
                                        left: 10, top: 10, right: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Theme.of(context).splashColor,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 15),
                                              child: SvgPicture.asset(
                                                'assets/svg/facebook.svg',
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Facebook',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              'холбох',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 20),
                                          child: Text(
                                            '10 оноо',
                                            style: TextStyle(
                                                color: red, fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
