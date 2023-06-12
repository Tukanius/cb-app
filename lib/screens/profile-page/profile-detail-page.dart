import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/components/description.dart';
import 'package:bank_core/components/who-type-card/who-type.card.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/profile-page/add-information-page.dart';
import 'package:bank_core/screens/profile-page/add-who-type-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class ProfileDetailPage extends StatefulWidget {
  static const routeName = "ProfileDetailPage";
  const ProfileDetailPage({Key? key}) : super(key: key);

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage>
    with AfterLayoutMixin {
  Customer customer = Customer();
  Customer relatedList = Customer();

  ListenController listenController = ListenController();
  User user = User();
  bool isLoading = true;

  @override
  afterFirstLayout(BuildContext context) async {
    customer = await CustomerApi().customerGet(user.customerId!);
    relatedList = await CustomerApi().relatedPersonList(user.customerId!);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    listenController.addListener(() async {
      customer = await CustomerApi().customerGet(user.customerId!);
      relatedList = await CustomerApi().relatedPersonList(user.customerId!);
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
          'Миний мэдээлэл',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
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
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Бүртгэл",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Description(
                      isDone: true,
                      label: 'Утасны дугаар',
                      name: '99865922',
                      onTap: () {
                        print("Утасны дугаар");
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Description(
                      isDone: false,
                      label: 'И-мейл',
                      name: 'moodyzeromn@gmail.com',
                      onTap: () {
                        print("И-мейл");
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Description(
                      isDone: false,
                      label: 'Хур систем /DAN/',
                      name: 'Хур систем',
                      onTap: () {
                        print("Хур систем");
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: buttonColor,
                      ),
                      child: Column(
                        children: [
                          Text("data"),
                          Text("data"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      labelColor: buttonColor,
                      textColor: white,
                      onClick: () {
                        Navigator.of(context).pushNamed(
                            AddInformationPage.routeName,
                            arguments: AddInformationPageArguments(
                                listenController: listenController));
                      },
                      labelText: "Нэмэлт мэдээлэл бөглөх",
                      boxShadow: true,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8, top: 30),
                      child: Text(
                        "Гэр бүлийн мэдээлэл",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    relatedList.rows?.length == 0
                        ? Column(
                            children: [
                              Lottie.asset('assets/lottie/empty.json',
                                  height: 200),
                              Text(
                                "Гэр бүлийн мэдээлэл хоосон байна",
                                style: TextStyle(color: grey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomButton(
                                labelColor: buttonColor,
                                textColor: white,
                                onClick: () {
                                  Navigator.of(context).pushNamed(
                                      AddWhoTypePage.routeName,
                                      arguments: AddWhoTypePageArguments(
                                          listenController: listenController));
                                },
                                labelText: "Гэр бүлийн мэдээлэл нэмэх",
                                boxShadow: true,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Column(
                                children: relatedList.rows!
                                    .map((e) => Container(
                                          child: Column(
                                            children: [
                                              WhoTypeCard(
                                                data: e,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              if (relatedList.rows!.length < 3)
                                CustomButton(
                                  labelColor: buttonColor,
                                  textColor: white,
                                  onClick: () {
                                    Navigator.of(context).pushNamed(
                                        AddWhoTypePage.routeName,
                                        arguments: AddWhoTypePageArguments(
                                            listenController:
                                                listenController));
                                  },
                                  labelText: "Гишүүн нэмэх",
                                  boxShadow: true,
                                ),
                            ],
                          )
                  ],
                ),
              ),
            ),
    );
  }
}
