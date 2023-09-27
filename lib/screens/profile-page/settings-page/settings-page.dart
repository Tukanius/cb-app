import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/screens/profile-page/change-email/change-email-page.dart';
import 'package:bank_core/screens/profile-page/change-password/change-password.dart';
import 'package:bank_core/screens/profile-page/change-phone/change-phone-page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = 'SettingsPage';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        elevation: 0,
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
        centerTitle: true,
        title: Text(
          'Тохиргоо',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ChangePasswordPage.routeName,
                    arguments: ChangePasswordPageArguments(isForgot: false),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).splashColor,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Нууц үг солих',
                        style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ChangeEmailPage.routeName);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).splashColor,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'И-мэйл солих',
                        style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ChangePhonePage.routeName);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).splashColor,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Утасны дугаар солих',
                        style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
