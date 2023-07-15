import 'dart:convert';
import 'dart:io';
import 'package:after_layout/after_layout.dart';
import 'package:bank_core/api/loan-api.dart';
import 'package:bank_core/models/qpay-urls.dart';
import 'package:bank_core/models/qpay.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QpayPageArguments {
  String loanPaybackGraphId;
  String loanId;
  double amount;
  QpayPageArguments({
    required this.loanPaybackGraphId,
    required this.amount,
    required this.loanId,
  });
}

class QpayPage extends StatefulWidget {
  final double amount;
  final String loanPaybackGraphId;
  final String loanId;
  static const routeName = "QPayPage";
  const QpayPage({
    required this.loanId,
    required this.loanPaybackGraphId,
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  QpayPageState createState() => QpayPageState();
}

class QpayPageState extends State<QpayPage> with AfterLayoutMixin<QpayPage> {
  bool loading = true;
  Qpay qpay = Qpay();

  @override
  void afterFirstLayout(BuildContext context) async {
    qpay = Qpay.fromJson(qpay.toJson());
    qpay.loanId = widget.loanId;
    qpay.loanPaybackGraphId = widget.loanPaybackGraphId;
    qpay.amount = widget.amount;
    qpay = await LoanApi().qpayment(qpay);
    setState(() {
      loading = false;
    });
  }

  Future<void> _launchInBrowser(String url, Urls link) async {
    try {
      if (!await launch("${url}")) throw 'Could not launch $url';
    } catch (e) {
      String storeLink = "";
      if (Platform.isIOS) {
        storeLink =
            "https://apps.apple.com/mn/app/${getDeepLink("${link.name}")}/id${getCode('${link.name}')}";
      } else {
        storeLink =
            "https://play.google.com/store/search?q=${"${link.name}"}&c=apps";
      }
      await launch(storeLink);
    }
  }

  Widget card(BuildContext context, Urls link) {
    return InkWell(
      key: UniqueKey(),
      onTap: () {
        _launchInBrowser(link.link.toString(), link);
        Navigator.of(context).pop();
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: darkGrey)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                '${link.logo}',
                height: 50,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.amount);
    if (loading == true) {
      return const SizedBox();
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(color: Theme.of(context).hoverColor),
              floating: true,
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 0.0,
              pinned: false,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "QPay",
                  style: TextStyle(
                      color: Theme.of(context).iconTheme.color, fontSize: 16),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: loading == true
                ? Center(
                    child: CircularProgressIndicator(
                      color: buttonColor,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          height: 230,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Image.memory(base64Decode("${qpay.qrImage}"),
                              width: 200),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "QPay ашиглан төлбөрөө хийх",
                        style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(10),
                            crossAxisCount: 3,
                            children: qpay.urls!
                                .map((e) => card(context, e))
                                .toList()),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

String getDeepLink(String name) {
  switch (name) {
    case "Khan bank":
      return "khan-bank";
    case "State bank":
      return "state-bank";
    case "Xac bank":
      return "khasbank";
    case "Trade and Development bank":
      return "tdb-online";
    case "Most money":
      return "mostmoney";
    case "National investment bank":
      return "nibank";
    case "Chinggis khaan bank":
      return "smartbank-ckbank";
    case "Capitron bank":
      return "capitron-bank";
    case "Bogd bank":
      return "bogd-mobile";
    default:
      return "";
  }
}

String? getCode(String name) {
  switch (name) {
    case "Khan bank":
      return '1555908766';
    case "State bank":
      return '703343972';
    case "Xac bank":
      return '1534265552';
    case "Trade and Development bank":
      return '1458831706';
    case "Most money":
      return '487144325';
    case "National investment bank":
      return '882075781';
    default:
  }
  return '';
}
