import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/get.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:provider/provider.dart';

class BonusCredit extends StatefulWidget {
  static const routeName = 'BonusCredit';
  final Customer? customer;
  const BonusCredit({Key? key, this.customer}) : super(key: key);

  @override
  State<BonusCredit> createState() => _BonusCreditState();
}

class _BonusCreditState extends State<BonusCredit> {
  Get get = Get();
  Customer customer = Customer();

  @override
  Widget build(BuildContext context) {
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
              height: 200,
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
                  GestureDetector(
                    onTap: () {
                      Provider.of<UserProvider>(context, listen: false)
                          .currentStep += 1;
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 35,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: buttonColor,
                      ),
                      child: Center(
                          child: Text(
                        'Түвшин ахиулах',
                        style: TextStyle(color: white),
                      )),
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
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).splashColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            'Найзаа урих',
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '+50',
                            style: TextStyle(color: red, fontSize: 18),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).splashColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            'Төлбөр төлөх',
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '+30',
                            style: TextStyle(color: red, fontSize: 18),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).splashColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            'Зээл төлөх',
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '+10',
                            style: TextStyle(color: red, fontSize: 18),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).splashColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            'Шилжүүлэг хийх',
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '+10',
                            style: TextStyle(color: red, fontSize: 18),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
