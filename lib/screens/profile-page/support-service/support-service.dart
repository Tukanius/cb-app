import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/screens/profile-page/faq/faq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SupportService extends StatefulWidget {
  static const routeName = 'SupportService';
  const SupportService({super.key});

  @override
  State<SupportService> createState() => _SupportServiceState();
}

class _SupportServiceState extends State<SupportService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        centerTitle: true,
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
          "Тусламж",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(FaqPage.routeName);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).splashColor,
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/question.svg',
                        height: 24,
                        width: 24,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Түгээмэл асуултууд",
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
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).pushNamed(ToContact.routeName);
              //   },
              //   child: Container(
              //     margin: EdgeInsets.only(bottom: 10),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Theme.of(context).splashColor,
              //     ),
              //     padding: const EdgeInsets.all(15),
              //     child: Row(
              //       children: [
              //         SvgPicture.asset(
              //           'assets/svg/contact.svg',
              //           height: 24,
              //           width: 24,
              //           color: Theme.of(context).iconTheme.color,
              //         ),
              //         SizedBox(
              //           width: 15,
              //         ),
              //         Text(
              //           "Холбоо барих",
              //           style: TextStyle(
              //             color: Theme.of(context).iconTheme.color,
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
