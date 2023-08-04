import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/profile-detail-card/show-detail-card.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';

class ShowDetail extends StatefulWidget {
  static const routeName = 'ShowDetail';
  const ShowDetail({super.key});

  @override
  State<ShowDetail> createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> with AfterLayoutMixin {
  bool isLaoding = true;
  Customer customer = Customer();
  User user = User();

  @override
  afterFirstLayout(BuildContext context) async {
    customer = await CustomerApi().customerGet(user.customerId!);
    setState(() {
      isLaoding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: true).user;
    return Scaffold(
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
          'Нэмэлт мэдээлэл',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: isLaoding == true
          ? Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 15, bottom: 15, top: 20),
                      child: Text(
                        'Бүртгүүлсэн мэдээлэл',
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ShowDetailCard(
                      data: customer,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
