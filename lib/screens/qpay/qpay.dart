// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'package:after_layout/after_layout.dart';
import 'package:bank_core/api/loan-api.dart';
import 'package:bank_core/components/action-button.dart';
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
    try {
      qpay = Qpay.fromJson(qpay.toJson());
      qpay.loanId = widget.loanId;
      qpay.loanPaybackGraphId = widget.loanPaybackGraphId;
      qpay.amount = widget.amount;
      qpay = await LoanApi().qpayment(qpay);
      setState(() {
        loading = false;
      });
    } catch (e) {
      print('======err======');
      print(e.toString());
      print('======err======');
    }
  }

  Future<void> _launchInBrowser(String url, Urls link) async {
    try {
      if (!await launch("${url}")) throw 'Could not launch $url';
    } catch (e) {
      String storeLink = "";
      if (Platform.isIOS) {
        storeLink =
            "https://apps.apple.com/mn/app/${getDeepLink("${link.name}")}/id${getCode('${link.name}')}";
        print('=========storelink========');
        print(storeLink.toString());
        print(link.name.toString());
        print('=========storelink========');
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
        body: loading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: buttonColor,
                ),
              )
            : SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          height: 230,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Image.memory(
                              base64Decode("${qpay.success?.qrImage}"),
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
                            children: qpay.success!.urls!
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
    case "qPay wallet":
      return "qpay-wallet";
    case "Khan bank":
      return "khan-bank";
    case "State bank":
      return "state-bank";
    case "Xac bank":
      return "xacbank";
    case "Trade and Development bank":
      return "tdb-online";
    case "Most money":
      return "mostmoney";
    case "National investment bank":
      return "nibank";
    case "Chinggis khaan bank":
      return "smartbank-ckbank";
    case "Capitron bank":
      return "capitron-digital-bank";
    case "Bogd bank":
      return "bogd-mobile";
    case "Trans bank":
      return "transbаnk";
    case "M bank":
      return "%D0%BC-bank";
    case "Ard App":
      return "ard-app";
    case "Arig bank":
      return "arig-online";
    default:
      return "";
  }
}

String? getCode(String name) {
  switch (name) {
    case "qPay wallet":
      return "1501873159";
    case "Khan bank":
      return "1555908766";
    case "State bank":
      return "703343972";
    case "Xac bank":
      return "1534265552";
    case "Trade and Development bank":
      return "1458831706";
    case "Most money":
      return "487144325";
    case "National investment bank":
      return "882075781";
    case "Chinggis khaan bank":
      return "1180620714";
    case "Capitron bank":
      return "1612591322";
    case "Bogd bank":
      return "1475442374";
    case "Trans bank":
      return "1604334470";
    case "M bank":
      return "1455928972";
    case "Ard App":
      return "6444296485";
    case "Arig bank":
      return "6444022675";
    default:
      return "";
  }
}
