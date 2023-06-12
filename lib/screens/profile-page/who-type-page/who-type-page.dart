import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/components/who-type-card/who-type.card.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/profile-page/who-type-page/add-who-type-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class WhoTypePage extends StatefulWidget {
  static const routeName = 'WhoTypePage';
  const WhoTypePage({Key? key}) : super(key: key);

  @override
  State<WhoTypePage> createState() => _WhoTypePageState();
}

class _WhoTypePageState extends State<WhoTypePage> with AfterLayoutMixin {
  Customer customer = Customer();
  bool isLoading = true;
  User user = User();
  ListenController listenController = ListenController();
  @override
  afterFirstLayout(BuildContext context) async {
    customer = await CustomerApi().relatedPersonList(user.customerId!);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    listenController.addListener(() async {
      customer = await CustomerApi().relatedPersonList(user.customerId!);
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: true).user;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
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
          'Холбоо хамаарал',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ActionButton(
              onClick: () {
                Navigator.of(context).pushNamed(AddWhoTypePage.routeName,
                    arguments: AddWhoTypePageArguments(
                        listenController: listenController));
              },
              icon: Icon(
                Icons.add,
                color: white,
                size: 14,
              ),
            ),
          )
        ],
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            )
          : customer.rows!.length == 0
              ? Column(children: [
                  Lottie.asset('assets/lottie/empty.json', height: 200),
                  Text(
                    "Хоосон байна",
                    style: TextStyle(color: grey),
                  ),
                ])
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15, bottom: 10, top: 20),
                        child: Text(
                          'Жагсаалт',
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Column(
                        children: customer.rows!
                            .map(
                              (e) => WhoTypeCard(
                                data: e,
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                ),
    );
  }
}
