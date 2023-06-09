import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_html/flutter_html.dart';

class TermofPolicyPage extends StatefulWidget {
  static const routeName = "/TermofPolicyPage";
  const TermofPolicyPage({Key? key}) : super(key: key);

  @override
  _TermofPolicyPageState createState() => _TermofPolicyPageState();
}

class _TermofPolicyPageState extends State<TermofPolicyPage>
    with AfterLayoutMixin {
  bool isLoading = true;

  @override
  void afterFirstLayout(BuildContext context) async {
    setState(() {
      isLoading = false;
    });
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Нууцлалын журам",
          style: TextStyle(
            fontSize: 16,
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
              color: white,
            ),
          ),
        ],
      ),
      body: isLoading == false
          ? SingleChildScrollView(
              controller: scrollController,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Html(data: "data"),
                  ],
                ),
              ),
            )
          : CircularProgressIndicator(
              color: black,
            ),
    );
  }
}
