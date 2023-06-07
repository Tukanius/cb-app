import 'package:bank_core/api/auth-api.dart';
import 'package:bank_core/api/loan-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/components/loan/schedule.dart';
import 'package:bank_core/models/general.dart';
import 'package:bank_core/models/get.dart';
import 'package:bank_core/models/loan.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoanPage extends StatefulWidget {
  static const routeName = 'LoanPage';
  const LoanPage({super.key});

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> with AfterLayoutMixin {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  onSubmit() async {}

  double currentValue = 0;
  int? selectedIndex;
  bool onTap = false;
  TextEditingController textController = TextEditingController();
  String selectedDay = "";
  String seletedDayId = "";

  bool isLoading = false;

  General general = General();

  Loan loan = Loan();

  Get get = Get();

  @override
  afterFirstLayout(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    get = await AuthApi().accountGet(user.customerId!);
    setState(() {
      isLoading = false;
    });
    print('=============GET============');
    print(get.toJson());
    print('=============GET============');
  }

  allowClear() {
    setState(() {
      textController.text = '';
    });
  }

  show(context) {
    showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Зээлийн нөхцөл',
                        style: TextStyle(
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Хугацаа',
                                style: TextStyle(
                                  color: black.withOpacity(0.7),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '2023.03.23 /${selectedDay} хоног/',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Зээлийн үндсэн дүн',
                                style: TextStyle(
                                  color: black.withOpacity(0.7),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "${currentValue}",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Сарын хүү 4.5%',
                                style: TextStyle(
                                  color: black.withOpacity(0.7),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "2'000.00₮",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Үйлчилгээний шимтгэл',
                                style: TextStyle(
                                  color: black.withOpacity(0.7),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "2'000.00₮",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Нийт төлөх дүн',
                                style: TextStyle(
                                  color: black.withOpacity(0.7),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "2'000.00₮",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20, right: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: buttonColor,
                            ),
                          ),
                          child: CustomButton(
                            labelColor: white,
                            labelText: 'Татгалзах',
                            boxShadow: false,
                            onClick: () {
                              Navigator.of(context).pop();
                            },
                            textColor: buttonColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 20, left: 4),
                          child: CustomButton(
                            labelColor: buttonColor,
                            labelText: 'Зөвшөөрөх',
                            boxShadow: true,
                            onClick: () {
                              showConfrim(context);
                            },
                            textColor: white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  showConfrim(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10, top: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.highlight_remove_sharp,
                            color: black,
                          ),
                        ),
                        alignment: Alignment.topRight,
                      ),
                      Container(
                        child: Text(
                          'Баталгаажуулах',
                          style: TextStyle(
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      FormBuilder(
                        key: fbKey,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: FormTextField(
                            obscureText: true,
                            inputType: TextInputType.visiblePassword,
                            controller: textController,
                            name: 'password',
                            suffixIcon: InkWell(
                              onTap: () {
                                allowClear();
                              },
                              child: Icon(
                                Icons.clear,
                                color: buttonColor,
                              ),
                            ),
                            hintText: 'Нууц үг',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Нууц үгээ оруулж баталгаажуулна уу.',
                        style: TextStyle(
                          color: black.withOpacity(0.7),
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                  child: CustomButton(
                    textColor: white,
                    labelColor: buttonColor,
                    boxShadow: true,
                    labelText: "Баталгаажуулах",
                    onClick: () async {
                      setState(() {
                        isLoading = true;
                      });
                      checkPassword(textController.text);
                      try {
                        loan.amount = currentValue;
                        loan.customerId = user.customerId;
                        loan.loanDate = DateTime.now().toString();
                        loan.loanRate = '3';
                        loan.loanTimeId = seletedDayId;
                        user.password = textController.text;
                        user.id = user.id;
                        await LoanApi().createLoan(loan);
                        setState(() {
                          isLoading = false;
                        });
                        showSuccesful(context);
                      } catch (e) {
                        print(e.toString());
                        print('=====err====');
                        setState(() {
                          isLoading = false;
                        });
                        showError(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  checkPassword(value) async {
    user.password = value;
    print('=======RESPONCE======');
    var res = await AuthApi().checkPassword(user);
    print(res);
    print('=======RESPONCE======');
  }

  showSuccesful(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: buttonColor, width: 3),
                        ),
                        child: Icon(
                          Icons.check,
                          color: buttonColor,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Танд амжилт хүсье',
                        style: TextStyle(
                            color: black.withOpacity(0.7), fontSize: 14),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Амжилттай',
                        style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 50,
                          right: 50,
                        ),
                        child: CustomButton(
                          textColor: white,
                          labelColor: buttonColor,
                          boxShadow: true,
                          labelText: "Ок",
                          onClick: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  )
                ],
              )),
        );
      },
    );
  }

  showError(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: buttonColor, width: 3),
                        ),
                        child: Icon(
                          Icons.error,
                          color: buttonColor,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Танд амжилт хүсье',
                        style: TextStyle(
                            color: black.withOpacity(0.7), fontSize: 14),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Амжилтгүй',
                        style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 50,
                          right: 50,
                        ),
                        child: CustomButton(
                          textColor: white,
                          labelColor: buttonColor,
                          boxShadow: true,
                          labelText: "Ок",
                          onClick: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  )
                ],
              )),
        );
      },
    );
  }

  User user = User();

  @override
  Widget build(BuildContext context) {
    general = Provider.of<GeneralProvider>(context, listen: false).general;
    user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
      backgroundColor: backgroundColor,
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
        title: Text(
          'Зээл авах',
          style: TextStyle(
            color: white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ActionButton(
              onClick: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.more_horiz,
                color: white,
                size: 20,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
            child: Container(
              height: 1,
              color: grey.withOpacity(0.12),
            ),
            preferredSize: Size.fromHeight(3)),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 45),
                        child: Text(
                          'Боломжит үлдэгдэл',
                          style: TextStyle(
                            color: grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${currentValue.toString()}',
                        style: TextStyle(
                          color: white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Slider(
                        min: 0,
                        max: double.parse(get.balance.toString()),
                        thumbColor: buttonColor,
                        activeColor: white,
                        inactiveColor: grey.withOpacity(0.2),
                        label: '${currentValue}',
                        divisions: 5,
                        value: currentValue,
                        onChanged: (double value) {
                          setState(() {
                            currentValue = value;
                          });
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '0',
                              style: TextStyle(
                                color: grey,
                              ),
                            ),
                            Text(
                              '${get.balance.toString()}',
                              style: TextStyle(color: grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 50, left: 15, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Хугацаа',
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Зээлийн хугацаа сонгох: ',
                              style: TextStyle(color: grey, fontSize: 12),
                            ),
                            selectedDay == ""
                                ? Text(
                                    '/Хугацаа сонгоно уу/',
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 12,
                                    ),
                                  )
                                : Text(
                                    '/${selectedDay}/',
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 12,
                                    ),
                                  )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: general.loanTimes!
                        .map(
                          (item) => LoanSchedule(
                            isSelected: item.day == selectedDay,
                            data: item.day,
                            onClick: () {
                              setState(() {
                                selectedDay = item.day!;
                                seletedDayId = item.id!;
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: darkGrey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Зээлийн хүү',
                          style: TextStyle(
                            color: grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "4.5%",
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: darkGrey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Төлөх огноо',
                          style: TextStyle(
                            color: grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "2023.03.23",
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 15, top: 30, bottom: 10),
                    child: Text(
                      'Хүлээн авах данс',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 10, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: darkGrey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image(
                                  image: AssetImage('images/2.png'),
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Golomt bank',
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '141 423 8739',
                                  style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: white,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    textColor: white,
                    labelColor: buttonColor,
                    onClick: () {
                      show(context);
                    },
                    labelText: 'Үргэлжлүүлэх',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
    );
  }
}
