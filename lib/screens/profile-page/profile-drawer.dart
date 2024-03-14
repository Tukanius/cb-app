import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/profile-page/bank-account-page/bank-accounts.dart';
import 'package:bank_core/screens/profile-page/benefit-ratio/benefit-ratio.dart';
import 'package:bank_core/screens/profile-page/profile-detail-page.dart';
import 'package:bank_core/screens/profile-page/settings-page/settings-page.dart';
import 'package:bank_core/screens/profile-page/support-service/support-service.dart';
import 'package:bank_core/screens/profile-page/term/term.dart';
import 'package:bank_core/screens/splash/splash.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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

    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.75,
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
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
                    Navigator.of(context)
                        .pushNamed(ProfileDetailPage.routeName);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).splashColor,
                    ),
                    padding: const EdgeInsets.all(12),
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
                    padding: const EdgeInsets.all(12),
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
                    padding: const EdgeInsets.all(12),
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
                    padding: const EdgeInsets.all(12),
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
                    padding: const EdgeInsets.all(12),
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
                    Navigator.of(context).pushNamed(BenefitRatio.routeName);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).splashColor,
                    ),
                    padding: const EdgeInsets.all(12),
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
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: transparent,
              ),
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
          ],
        ),
      ),
    );
  }
}
