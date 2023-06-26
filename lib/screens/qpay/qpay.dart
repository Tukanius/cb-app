import 'package:after_layout/after_layout.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QpayPageArguments {
  final double? amount;
  final String? accountId;

  QpayPageArguments({
    this.accountId,
    this.amount,
  });
}

class QpayPage extends StatefulWidget {
  final double? amount;
  final String? accountId;

  static const routeName = "QPayPage";
  const QpayPage({
    Key? key,
    this.accountId,
    this.amount,
  }) : super(key: key);

  @override
  QpayPageState createState() => QpayPageState();
}

class QpayPageState extends State<QpayPage> with AfterLayoutMixin<QpayPage> {
  bool loading = false;

  @override
  void afterFirstLayout(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    if (loading == true) {
      return const SizedBox();
    }
    return Scaffold(
      backgroundColor: backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return <Widget>[
            const SliverAppBar(
              iconTheme: IconThemeData(color: white),
              floating: true,
              backgroundColor: backgroundColor,
              elevation: 0.0,
              pinned: false,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "QPay",
                  style: TextStyle(color: white, fontSize: 16),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 230,
                    width: 230,
                    // child: Image.memory(base64Decode("123"), width: 200),
                    child: SvgPicture.asset(
                      'assets/svg/qrCode.svg',
                      color: white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "QPay ашиглан төлбөрөө хийх",
                  style: TextStyle(
                      color: white, fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    crossAxisCount: 3,
                    children: [
                      for (int i = 0; i < 3; i++) card(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchInBrowser(String url) async {}

Widget card(BuildContext context) {
  return InkWell(
    key: UniqueKey(),
    onTap: () {
      _launchInBrowser("");
      Navigator.of(context).pop();
    },
    child: Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "",
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "123",
            style: const TextStyle(color: white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
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
