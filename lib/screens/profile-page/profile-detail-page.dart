import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/components/description.dart';
import 'package:bank_core/components/who-type-card/who-type.card.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/result.dart';
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
  Result relatedList = Result(rows: [], count: 0);
  int page = 1;
  int limit = 10;

  ListenController listenController = ListenController();
  User user = User();
  bool isLoading = true;

  @override
  afterFirstLayout(BuildContext context) async {
    customer = await CustomerApi().customerGet(user.customerId!);
    list(page, limit);
    setState(() {
      isLoading = false;
    });
  }

  list(page, limit) async {
    Offset offset = Offset(page: page, limit: limit);
    Filter filter = Filter();
    relatedList = await CustomerApi()
        .relatedPersonList(ResultArguments(filter: filter, offset: offset));
  }

  @override
  void initState() {
    listenController.addListener(() async {
      customer = await CustomerApi().customerGet(user.customerId!);
      list(page, limit);
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
                      name: '${user.phone}',
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
                      name: '${user.email}',
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
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: darkGrey,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Овог:',
                                      style: TextStyle(
                                        color: grey,
                                      ),
                                    ),
                                    Text(
                                      '${user.lastName}',
                                      style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Нэр:',
                                      style: TextStyle(
                                        color: grey,
                                      ),
                                    ),
                                    Text(
                                      '${user.firstName}',
                                      style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AddInformationPage.routeName,
                                arguments: AddInformationPageArguments(
                                    listenController: listenController),
                              );
                            },
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                "Нэмэлт мэдээлэл бөглөх",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8, top: 20),
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
