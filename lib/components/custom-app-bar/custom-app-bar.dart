import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/notification-page/notification-page.dart';
import 'package:bank_core/screens/profile-page/profile-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: true).user;
    final isView = Provider.of<UserProvider>(context, listen: true).isView;
    final isDarkMode = Provider.of<UserProvider>(context, listen: true).check;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      color: Theme.of(context).colorScheme.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProfilePage.routeName);
            },
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
          Row(
            children: [
              ActionButton(
                icon: isDarkMode == false
                    ? SvgPicture.asset(
                        "assets/svg/dark-mode.svg",
                        height: 24,
                        width: 24,
                        color: white,
                      )
                    : SvgPicture.asset(
                        "assets/svg/dark-mode.svg",
                        height: 24,
                        width: 24,
                        color: black,
                      ),
                onClick: () {
                  Provider.of<UserProvider>(context, listen: false)
                      .toggleDarkMode(!isDarkMode);
                  final provider =
                      Provider.of<UserProvider>(context, listen: false);
                  provider.toggleTheme(!provider.isDarkMode);
                  print(!provider.isDarkMode);
                },
              ),
              SizedBox(
                width: 10,
              ),
              ActionButton(
                icon: isView == false
                    ? Icon(
                        Icons.visibility,
                        color: Theme.of(context).hoverColor,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: Theme.of(context).hoverColor,
                      ),
                onClick: () async {
                  await Provider.of<UserProvider>(context, listen: false)
                      .setView(!isView);
                },
              ),
              SizedBox(
                width: 10,
              ),
              ActionButton(
                onClick: () {
                  Navigator.of(context).pushNamed(NotificationPage.routeName);
                },
                icon: Icon(
                  Icons.notifications,
                  color: Theme.of(context).hoverColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
