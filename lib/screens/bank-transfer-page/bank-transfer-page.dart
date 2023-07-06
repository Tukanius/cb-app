import 'package:bank_core/components/action-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BankTransferPageArguments {
  String code;
  String totalPayAmount;
  BankTransferPageArguments({
    required this.code,
    required this.totalPayAmount,
  });
}

class BankTransferPage extends StatefulWidget {
  static const routeName = "BankTransferPage";
  final String code;
  final String totalPayAmount;
  const BankTransferPage({
    Key? key,
    required this.code,
    required this.totalPayAmount,
  }) : super(key: key);

  @override
  State<BankTransferPage> createState() => _BankTransferPageState();
}

class _BankTransferPageState extends State<BankTransferPage> {
  TextEditingController diaryTextEditingController = TextEditingController();
  bool isTap = false;
  bool isCopied = false;
  bool isCopy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
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
        title: Text(
          'Банкны шилжүүлэг',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Шилжүүлэх данс',
              style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).splashColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Транс банк - ',
                        style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.w500),
                      ),
                      SelectableText(
                        '900 004 7728',
                        style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'MNT',
                        style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        isCopied = true;
                      });
                      Clipboard.setData(ClipboardData(text: '2209250401')).then(
                        (value) {
                          return ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Theme.of(context).disabledColor,
                              content: Text('Амжилттай хуулсан'),
                            ),
                          );
                        },
                      );
                    },
                    child: isCopied == false
                        ? Icon(
                            Icons.copy,
                            color: Theme.of(context).iconTheme.color,
                          )
                        : Icon(
                            Icons.check,
                            color: Theme.of(context).iconTheme.color,
                          ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Гүйлгээний утга',
              style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).splashColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectableText(
                    '${widget.code}',
                    style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTap = true;
                      });
                      Clipboard.setData(ClipboardData(text: '${widget.code}'))
                          .then(
                        (value) {
                          return ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Theme.of(context).disabledColor,
                              content: Text('Амжилттай хуулсан'),
                            ),
                          );
                        },
                      );
                    },
                    child: isTap == false
                        ? Icon(
                            Icons.copy,
                            color: Theme.of(context).iconTheme.color,
                          )
                        : Icon(
                            Icons.check,
                            color: Theme.of(context).iconTheme.color,
                          ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Гүйлгээний дүн',
              style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).splashColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectableText(
                    '${widget.totalPayAmount}',
                    style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCopy = true;
                      });
                      Clipboard.setData(
                              ClipboardData(text: '${widget.totalPayAmount}'))
                          .then(
                        (value) {
                          return ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Theme.of(context).disabledColor,
                              content: Text('Амжилттай хуулсан'),
                            ),
                          );
                        },
                      );
                    },
                    child: isCopy == false
                        ? Icon(
                            Icons.copy,
                            color: Theme.of(context).iconTheme.color,
                          )
                        : Icon(
                            Icons.check,
                            color: Theme.of(context).iconTheme.color,
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
