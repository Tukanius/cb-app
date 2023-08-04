import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/who-type-card/who-type.card.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class WhoType extends StatefulWidget {
  static const routeName = 'WhoType';
  const WhoType({super.key});

  @override
  State<WhoType> createState() => _WhoTypeState();
}

class _WhoTypeState extends State<WhoType> with AfterLayoutMixin {
  bool isLoading = true;
  Result relatedList = Result(rows: [], count: 0);
  int page = 1;
  int limit = 10;

  @override
  afterFirstLayout(BuildContext context) async {
    list(page, limit);
    setState(() {
      isLoading = false;
      print('!!!!WHOTYPE!!!');
      print(relatedList.rows);
      print('!!!!WHOTYPE!!!');
    });
  }

  list(page, limit) async {
    setState(() {
      isLoading = true;
    });
    Offset offset = Offset(page: page, limit: limit);
    Filter filter = Filter();
    relatedList = await CustomerApi()
        .relatedPersonList(ResultArguments(filter: filter, offset: offset));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          'Гэр бүлийн гишүүн',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: isLoading == true
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
                        'Бүртгүүлсэн гэр бүлийн гишүүн',
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Column(
                      children: relatedList.rows!
                          .map(
                            (data) => WhoTypeCard(
                              data: data,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
