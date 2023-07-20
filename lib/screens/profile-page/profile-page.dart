// ignore_for_file: deprecated_member_use

import 'package:bank_core/screens/profile-page/address/address.dart';
import 'package:bank_core/screens/profile-page/benefit-ratio/benefit-ratio.dart';
import 'package:bank_core/screens/profile-page/settings-page/settings-page.dart';
import 'package:bank_core/screens/profile-page/support-service/support-service.dart';
import 'package:bank_core/screens/profile-page/term/term.dart';
import 'package:bank_core/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/profile-page/bank-account-page/bank-accounts.dart';
import 'package:bank_core/screens/profile-page/profile-detail-page.dart';
import 'package:bank_core/screens/splash/splash.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = 'ProfilePage';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user = User();
  bool isSubmit = false;
  final SecureStorage secureStorage = SecureStorage();

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
                    SvgPicture.asset(
                      'assets/svg/avatar.svg',
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Сайн уу? 👋',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '${user.firstName}',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
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
                    color: Theme.of(context).splashColor,
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Нэмэлт мэдээлэл",
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
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
                    color: Theme.of(context).splashColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_card_rounded,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Данс холбох",
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
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
                  Navigator.of(context).pushNamed(SettingsPage.routeName);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).splashColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Тохиргоо",
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
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
                    color: Theme.of(context).splashColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/document.svg',
                        height: 24,
                        width: 24,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Үйлчилгээний нөхцөл",
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
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
                  Navigator.of(context).pushNamed(SupportService.routeName);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).splashColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/faq.svg',
                        height: 24,
                        width: 24,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Тусламж",
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
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
                  // secureStorage.deleteAll();
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).splashColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/home.svg',
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Гэрийн хаяг нэмэх",
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
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
                  Navigator.of(context).pushNamed(BenefitRatio.routeName);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).splashColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.balance_outlined,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Өр орлогын харьцаа",
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
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
                  isLoading: isSubmit,
                  textColor: white,
                  labelColor: red,
                  boxShadow: false,
                  onClick: () {
                    logout();
                  },
                  labelText: 'Гарах',
                ),
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
