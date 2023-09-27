import 'package:bank_core/api/general-api.dart';
import 'package:bank_core/components/accordion.dart';
import 'package:bank_core/models/answer.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:bank_core/components/action-button.dart';

class FaqPage extends StatefulWidget {
  static const routeName = "/FaqPage";
  const FaqPage({Key? key}) : super(key: key);

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> with AfterLayoutMixin {
  bool isLoading = true;
  Answer answer = Answer();

  @override
  void afterFirstLayout(BuildContext context) async {
    answer = await GeneralApi().faqList();
    setState(() {
      isLoading = false;
    });
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
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
          "Түгээмэл асуултууд",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLoading == false
          ? SingleChildScrollView(
              controller: scrollController,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Column(
                      children: answer.rows!
                          .map(
                            (data) => Accordion(
                              data: data,
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            ),
    );
  }
}
