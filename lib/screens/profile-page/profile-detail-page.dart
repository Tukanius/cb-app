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
    print(customer.result?.email);
    print('=======customer======');
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
        title: Text(
          'Миний мэдээлэл',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
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
                          color: Theme.of(context).iconTheme.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Description(
                      isDone: true,
                      label: 'Утасны дугаар',
                      name: '${customer.result?.phone}',
                      onTap: () {
                        print("Утасны дугаар");
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    customer.result?.email == null
                        ? SizedBox()
                        : Description(
                            isDone: false,
                            label: 'И-мейл',
                            name: '${customer.result?.email}',
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
                        color: Theme.of(context).splashColor,
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
                                        color: Theme.of(context).disabledColor,
                                      ),
                                    ),
                                    Text(
                                      '${customer.result?.lastName}',
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).iconTheme.color,
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
                                        color: Theme.of(context).disabledColor,
                                      ),
                                    ),
                                    Text(
                                      '${customer.result?.firstName}',
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                customer.result?.email == null
                                    ? SizedBox()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'И-Мэйл:',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                            ),
                                          ),
                                          Text(
                                            '${customer.result?.email}',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                SizedBox(
                                  height: 10,
                                ),
                                customer.result?.birthDate == null
                                    ? SizedBox()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Төрсөн өдөр:',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                            ),
                                          ),
                                          Text(
                                            '${customer.result?.birthDate}',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                SizedBox(
                                  height: 10,
                                ),
                                customer.result?.educationType == null
                                    ? SizedBox()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Боловсрол:',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${customer.result?.educationType?.name}',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            softWrap: false,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                          ),
                                        ],
                                      ),
                                SizedBox(
                                  height: 10,
                                ),
                                customer.result?.nationalityType == null
                                    ? SizedBox()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Яс үндэс :',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                            ),
                                          ),
                                          Text(
                                            '${customer.result?.nationalityType?.name}',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                SizedBox(
                                  height: 10,
                                ),
                                customer.result?.gender == null
                                    ? SizedBox()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Хүйс :',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                            ),
                                          ),
                                          Text(
                                            '${customer.result?.gender?.name}',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                          customer.result?.nationalityType != null
                              ? SizedBox()
                              : GestureDetector(
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
                          color: Theme.of(context).iconTheme.color,
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
                                style: TextStyle(color: Colors.grey),
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
                          ),
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
