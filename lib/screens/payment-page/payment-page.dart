// ignore_for_file: deprecated_member_use

import 'package:bank_core/api/auth-api.dart';
import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/bank-transfer-page/bank-transfer-page.dart';
import 'package:bank_core/screens/qpay/qpay.dart';
import 'package:bank_core/utils/utils.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PaymentPageArguments {
  String code;
  String totalPayAmount;
  String loanId;
  String loanResidual;
  String loanDate;
  ListenController listenController;
  String loanPaybackGraphId;
  PaymentPageArguments({
    required this.loanDate,
    required this.loanPaybackGraphId,
    required this.code,
    required this.totalPayAmount,
    required this.loanResidual,
    required this.loanId,
    required this.listenController,
  });
}

class PaymentPage extends StatefulWidget {
  final String loanDate;
  final String loanPaybackGraphId;
  final String code;
  final String totalPayAmount;
  final String loanResidual;
  final String loanId;
  final ListenController listenController;
  static const routeName = 'PaymentPage';
  const PaymentPage({
    Key? key,
    required this.loanDate,
    required this.loanPaybackGraphId,
    required this.code,
    required this.totalPayAmount,
    required this.loanResidual,
    required this.loanId,
    required this.listenController,
  }) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> with AfterLayoutMixin {
  User user = User();
  User loan = User();
  bool isLoading = true;
  bool isSubmit = false;
  String paymentType = "";
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  TextEditingController textController = TextEditingController();

  @override
  afterFirstLayout(BuildContext context) async {
    setState(() {
      isLoading = false;
    });
  }

  onSubmit(context) async {
    if (fbKey.currentState!.saveAndValidate()) {
      try {
        setState(() {
          isSubmit = true;
        });
        User loan = User.fromJson(fbKey.currentState!.value);
        loan.id = user.customerId;
        await AuthApi().checkPassword(loan);
        Customer customer = Customer();
        customer.amount = double.parse(widget.loanResidual.toString());
        customer.loanId = widget.loanId;
        customer.paidDate = DateTime.now().toString();
        await CustomerApi().pay(customer);
        widget.listenController.changeVariable("loadpayment");
        await show(context);
        setState(() {
          isSubmit = false;
        });
      } catch (e) {
        setState(() {
          isSubmit = false;
        });
        print(e.toString());
      }
    }
  }

  showVerifyModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Theme.of(context).colorScheme.background,
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
                    color: Theme.of(context).iconTheme.color,
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
                      textColor: Theme.of(context).iconTheme.color,
                      name: "password",
                      controller: textController,
                      hintText: 'Нууц үгээ оруулна уу',
                      inputType: TextInputType.text,
                      obscureText: true,
                      autoFocus: true,
                      labelText: "Нууц үг",
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'Нууц үгээ оруулна уу.',
                        )
                      ]),
                      color: Theme.of(context).splashColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      boxShadow: true,
                      isLoading: isSubmit,
                      labelText: "Баталгаажуулах",
                      onClick: () {
                        if (isSubmit == false) {
                          onSubmit(context);
                        }
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

  show(ctx) async {
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
                        'Төлөлт амжилттай хийгдлээ.',
                        textAlign: TextAlign.center,
                      ),
                      ButtonBar(
                        buttonMinWidth: 100,
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: const Text(
                              "Дуусгах",
                              style: TextStyle(color: dark),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(ctx).pop();
                              Navigator.of(ctx).pop();
                              Navigator.of(ctx).pop();
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

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.all(10),
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
        title: Text(
          'Зээл төлөх',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 20),
                      child: Text(
                        "Төлөх дүн",
                        style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          color: Theme.of(context).splashColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Нийт төлөх дүн:',
                              style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${Utils().formatCurrency(widget.loanResidual)} ₮',
                              style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        'Төлөх',
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(QpayPage.routeName,
                            arguments: QpayPageArguments(
                                loanId: widget.loanId,
                                loanPaybackGraphId: widget.loanPaybackGraphId,
                                amount: double.parse(
                                    widget.totalPayAmount.toString())));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).splashColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image(
                                image: AssetImage('images/3.png'),
                                height: 24,
                                width: 24,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "QPay",
                              style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          BankTransferPage.routeName,
                          arguments: BankTransferPageArguments(
                              code: widget.code,
                              totalPayAmount: widget.totalPayAmount),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).splashColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: SvgPicture.asset(
                                'assets/svg/bank.svg',
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Банкаар шилжүүлэх",
                              style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        'Дараагийн төлөлт',
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).splashColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'images/schedule.svg',
                                height: 20,
                                width: 20,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Төлбөр хийх өдөр',
                                style: TextStyle(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                          Text(
                            "${widget.loanDate}",
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),

                    // Container(
                    //   child: CustomButton(
                    //     isLoading: isSubmit,
                    //     boxShadow: true,
                    //     labelColor: buttonColor,
                    //     labelText: 'Төлбөр хийх',
                    //     onClick: () {
                    //       showVerifyModal();
                    //     },
                    //     textColor: white,
                    //   ),
                    // ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
