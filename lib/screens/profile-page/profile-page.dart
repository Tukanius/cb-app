import 'package:bank_core/screens/profile-page/change-password/change-password.dart';
import 'package:bank_core/screens/profile-page/faq/faq.dart';
import 'package:bank_core/screens/profile-page/term/term.dart';
import 'package:flutter/material.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/bank-account-page/bank-accounts.dart';
import 'package:bank_core/screens/profile-page/address/address.dart';
import 'package:bank_core/screens/profile-page/profile-detail-page.dart';
import 'package:bank_core/screens/splash/splash.dart';
import 'package:bank_core/screens/profile-page/who-type-page/who-type-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = 'ProfilePage';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user = User();
  bool isSubmit = false;

  logout() async {
    setState(() {
      isSubmit = true;
    });
    await Provider.of<UserProvider>(context, listen: false).logout();
    Navigator.of(context).pushNamed(SplashScreen.routeName);
    setState(() {
      isSubmit = false;
    });
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
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          shape: BoxShape.circle, width: 40, height: 40),
                    ),
                    // Container(
                    //     decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         color: grey.withOpacity(0.3),
                    //         image: DecorationImage(
                    //             image: NetworkImage(
                    //                 "https://sm.ign.com/ign_ap/cover/a/avatar-gen/avatar-generations_hugw.jpg"))),
                    //     height: 40,
                    //     width: 40,
                    //   ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Сайн уу? 👋',
                          style: TextStyle(
                            color: grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '${user.firstName}',
                          style: TextStyle(
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ProfileDetailPage.routeName);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10, top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkGrey,
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Миний мэдээлэл",
                        style: TextStyle(
                          color: white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(BankAccounts.routeName);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkGrey,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_card_rounded,
                        color: white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Данс холбох",
                        style: TextStyle(
                          color: white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ChangePasswordPage.routeName);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkGrey,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock,
                        color: white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Нэвтрэх тохиргоо",
                        style: TextStyle(
                          color: white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(TermofPolicyPage.routeName);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkGrey,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/document.svg',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Үйлчилгээний нөхцөл",
                        style: TextStyle(
                          color: white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(FaqPage.routeName);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkGrey,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/faq.svg',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Тусламж",
                        style: TextStyle(
                          color: white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(WhoTypePage.routeName);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkGrey,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Холбоо хамаарал",
                        style: TextStyle(
                          color: white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AddAddress.routeName);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkGrey,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/home.svg',
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Гэрийн хаяг нэмэх",
                        style: TextStyle(
                          color: white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7), color: transparent),
                child: CustomButton(
                  textColor: white,
                  labelColor: red,
                  boxShadow: false,
                  onClick: () {
                    logout();
                  },
                  labelText: 'Гарах',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
