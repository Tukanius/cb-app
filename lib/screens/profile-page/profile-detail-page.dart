import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/profile-page/add-information-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';

class ProfileDetailPage extends StatefulWidget {
  static const routeName = "ProfileDetailPage";
  const ProfileDetailPage({Key? key}) : super(key: key);

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage>
    with AfterLayoutMixin {
  Customer customer = Customer();
  ListenController listenController = ListenController();
  User user = User();
  bool isLoading = true;

  @override
  afterFirstLayout(BuildContext context) async {
    customer = await CustomerApi().customerGet(user.customerId!);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    listenController.addListener(() async {
      customer = await CustomerApi().customerGet(user.customerId!);
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: true).user;
    print(customer.marriageStatus?.toJson());
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
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: ActionButton(
              onClick: () {
                Navigator.of(context).pushNamed(
                  AddInformationPage.routeName,
                  arguments: AddInformationPageArguments(
                      listenController: listenController),
                );
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
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 8),
                      child: Text(
                        "Дэлгэрэнгүй",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    customer.result?.familyName != null
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkGrey,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ургын овог',
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${customer.result?.familyName}",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 8,
                    ),
                    customer.result?.nationalityTypeId != null
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkGrey,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Яс үндэс',
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${customer.result?.incomeAmountMonth}",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: darkGrey,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Овог',
                            style: TextStyle(
                              color: grey,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${customer.result?.lastName}",
                            style: TextStyle(
                              color: white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: darkGrey,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Нэр',
                            style: TextStyle(
                              color: grey,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${customer.result?.firstName}",
                            style: TextStyle(
                              color: white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: darkGrey,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Утасны дугаар',
                            style: TextStyle(
                              color: grey,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${customer.result?.phone}",
                            style: TextStyle(
                              color: white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: darkGrey,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'И-мэйл хаяг',
                            style: TextStyle(
                              color: grey,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${customer.result?.email}",
                            style: TextStyle(
                              color: white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    customer.result?.marriageStatusId != null
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkGrey,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Гэрлэсэн эсэх',
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${customer.result?.marriageStatus?.name}",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 8,
                    ),
                    customer.result?.educationTypeId != null
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkGrey,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Боловсролын зэрэг',
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${customer.result?.educationType?.name}",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 8,
                    ),
                    customer.result?.familyCount != null
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkGrey,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ам бүлийн тоо',
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${customer.result?.familyCount}",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 8,
                    ),
                    customer.result?.incomeAmountMonth != null
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkGrey,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Сарын орлого',
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${customer.result?.incomeAmountMonth}",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 8,
                    ),
                    customer.result?.genderId != null
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkGrey,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Хүйс',
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${customer.result?.gender?.name}",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 8,
                    ),
                    customer.result?.birthPlace != null
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkGrey,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Төрсөн газар',
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${customer.result?.birthPlace}",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 8,
                    ),
                    customer.result?.workStatusId != null
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkGrey,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ажил эрхлэлт',
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${customer.result?.workStatus?.name}",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
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
