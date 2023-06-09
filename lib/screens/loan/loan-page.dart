import 'package:bank_core/api/auth-api.dart';
import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/api/loan-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/components/loan/schedule.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/general.dart';
import 'package:bank_core/models/get.dart';
import 'package:bank_core/models/loan.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/bank-account-page/add-bank-account-page.dart';
import 'package:bank_core/utils/utils.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:rainbow_color/rainbow_color.dart';
import 'package:lottie/lottie.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoanPageArguments {
  ListenController listenController;
  LoanPageArguments({
    required this.listenController,
  });
}

class LoanPage extends StatefulWidget {
  static const routeName = 'LoanPage';
  final ListenController listenController;
  const LoanPage({super.key, required this.listenController});

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage>
    with AfterLayoutMixin, SingleTickerProviderStateMixin {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  double currentValue = 0;
  int? selectedIndex;
  bool onTap = false;
  TextEditingController textController = TextEditingController();
  String selectedDay = "";
  String seletedDayId = "";
  String selectedMethod = "";
  bool isLoading = false;
  bool isModalLoading = false;
  Customer bankList = Customer();
  General general = General();
  User user = User();
  Get get = Get();
  Loan loan = Loan();
  bool isDateError = false;
  bool isBankError = false;
  bool isValueError = false;
  late AnimationController controller;
  late Animation<Color> _colorAnim;
  DateTime futureDate = DateTime.now();
  ListenController listenController = ListenController();

  @override
  void initState() {
    super.initState();
    listenController.addListener(() async {
      setState(() {
        isLoading = true;
      });
      bankList = await CustomerApi().bankAccountList(user.customerId!);
      setState(() {
        isLoading = false;
      });
    });
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _colorAnim =
        RainbowColorTween([Colors.red, Colors.white]).animate(controller)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reset();
            } else if (status == AnimationStatus.dismissed) {
              controller.forward();
            }
          });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  afterFirstLayout(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    get = await AuthApi().accountGet(user.customerId!);
    bankList = await CustomerApi().bankAccountList(user.customerId!);
    setState(() {
      isLoading = false;
    });
  }

  showModal() async {
    if (currentValue < 50000) {
      setState(() {
        isValueError = true;
      });
      print("error value ===> ${currentValue}");
    }
    if (selectedDay == "") {
      setState(() {
        isDateError = true;
      });
      print("error date ===> ${selectedDay}");
    }
    if (selectedMethod == "") {
      setState(() {
        isBankError = true;
      });
      print("error bank ===> ${selectedMethod}");
    }
    if (isBankError == false && isDateError == false && isValueError == false) {
      showVerifyModal();
    } else {
      print("error");
    }
  }

  onSubmit(ctx) async {
    if (fbKey.currentState!.saveAndValidate()) {
      user.password = textController.text;
      user.id = user.customerId;
      var res = await AuthApi().checkPassword(user);
      if (res == true) {
        loan.amount = currentValue;
        loan.customerId = user.customerId;
        loan.loanDate = DateTime.now().toString();
        loan.loanRate = '3';
        loan.loanTimeId = seletedDayId;
        user.id = user.id;
        await LoanApi().createLoan(loan);
        setState(() {
          isLoading = false;
        });
        widget.listenController.changeVariable("loanCreate");
        Navigator.of(context).pop();
        showSuccess(context);
        Navigator.of(ctx).pop();
      } else {
        showError(context);
      }
    }
  }

  showSuccess(ctx) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 75),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Амжилттай',
                        style: TextStyle(
                            color: dark,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Зээлийн хүсэлт амжилттай илгээгдлээ.',
                        textAlign: TextAlign.center,
                      ),
                      ButtonBar(
                        buttonMinWidth: 100,
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            child: const Text(
                              "За",
                              style: TextStyle(color: dark),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Lottie.asset('assets/lottie/success.json',
                    height: 150, repeat: false),
              ],
            ),
          );
        });
  }

  showError(ctx) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 75),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Амжилтгүй',
                        style: TextStyle(
                            color: dark,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Та мэдээлэлээ дахин шалгана уу.',
                        textAlign: TextAlign.center,
                      ),
                      ButtonBar(
                        buttonMinWidth: 100,
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            child: const Text(
                              "За",
                              style: TextStyle(color: dark),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Lottie.asset('assets/lottie/error.json',
                    height: 150, repeat: false),
              ],
            ),
          );
        });
  }

  showVerifyModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: mainColor,
          height: 270,
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 30,
                ),
                child: Text(
                  "Баталгаажуулалт",
                  style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FormBuilder(
                key: fbKey,
                child: Column(
                  children: [
                    FormTextField(
                      name: "password",
                      controller: textController,
                      hintText: 'Нууц үгээ оруулна уу',
                      inputType: TextInputType.text,
                      obscureText: true,
                      autoFocus: true,
                      labelText: "Нууц үг",
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Нэвтрэх нэрээ оруулна уу.')
                      ]),
                      color: darkGrey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      boxShadow: true,
                      labelText: "Баталгаажуулах",
                      onClick: () {
                        onSubmit(context);
                      },
                      textColor: white,
                      labelColor: buttonColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    general = Provider.of<GeneralProvider>(context, listen: true).general;
    user = Provider.of<UserProvider>(context, listen: true).user;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
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
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
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
                          '${Utils().formatCurrency("${currentValue}")}₮',
                          style: TextStyle(
                            color:
                                isValueError == true ? _colorAnim.value : white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        isValueError == true
                            ? Container(
                                width: 240,
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  'Хамгийн багадаа 50,000₮ өөр зээл авах боломжтой',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: red,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (currentValue > 0) {
                                  setState(() {
                                    currentValue -= 10000;
                                  });
                                }
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: darkGrey,
                                ),
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  child: SvgPicture.asset(
                                    'assets/svg/minus.svg',
                                    color: white,
                                    theme: SvgTheme(currentColor: white),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Slider(
                                min: 0,
                                max: double.parse(get.balance.toString()),
                                thumbColor: buttonColor,
                                divisions: 5,
                                activeColor: white,
                                inactiveColor: grey.withOpacity(0.2),
                                label: '${currentValue}',
                                value: currentValue,
                                onChanged: (double value) {
                                  setState(() {
                                    currentValue = value;
                                    if (currentValue > 50000) {
                                      isValueError = false;
                                    } else {
                                      isValueError = true;
                                    }
                                  });
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (currentValue <
                                    double.parse("${get.balance}")) {
                                  setState(() {
                                    currentValue += 10000;
                                  });
                                }
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: darkGrey,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: white,
                                ),
                              ),
                            ),
                          ],
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
                      margin: EdgeInsets.only(top: 30, bottom: 10),
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
                              Text(
                                '/Хугацаа сонгоно уу/',
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: general.loanTimes!
                          .map(
                            (item) => LoanSchedule(
                              isSelected: item.day == selectedDay,
                              error: isDateError,
                              data: item.day,
                              onClick: () {
                                setState(() {
                                  selectedDay = item.day!;
                                  seletedDayId = item.id!;
                                  isDateError = false;
                                  DateTime now = DateTime.now();
                                  futureDate = now.add(
                                      Duration(days: int.parse(selectedDay)));
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
                            "${Moment.parse(futureDate.toString()).format("YYYY-MM-DD")}",
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      child: Text(
                        'Хүлээн авах данс',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    if (bankList.rows?.length != 0)
                      DropdownButtonFormField(
                        onChanged: (value) {
                          setState(() {
                            selectedMethod = "${value?.name}";
                            isBankError = false;
                          });
                          ;
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: "Заавал сонгоно уу"),
                        ]),
                        dropdownColor: mainColor,
                        itemHeight: 70,
                        menuMaxHeight: 400,
                        elevation: 2,
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(10),
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Данс сонгоно уу',
                          hintStyle: TextStyle(color: grey, fontSize: 14),
                          filled: true,
                          fillColor: darkGrey,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: bankList.rows
                            ?.map(
                              (item) => DropdownMenuItem(
                                enabled: true,
                                value: item,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage("images/4.png"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${item.accountNumber} / ${item.bank?.name}",
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      )
                    else
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Холбосон данс байхгүй байна",
                                style: TextStyle(color: greyDark, fontSize: 12),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        AddBankAccountPage.routeName,
                                        arguments: AddBankAccountPageArguments(
                                            listenController:
                                                listenController));
                                  },
                                  child: Text(
                                    "Данс холбох",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ))
                            ],
                          )),
                    isBankError == true
                        ? Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 5),
                            child: Text(
                              "Банкаа сонгоно уу",
                              style: TextStyle(color: red, fontSize: 12),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: CustomButton(
                        textColor: white,
                        labelColor: buttonColor,
                        onClick: () {
                          showModal();
                        },
                        labelText: 'Үргэлжлүүлэх',
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
