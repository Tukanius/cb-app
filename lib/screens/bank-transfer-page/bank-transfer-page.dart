import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BankTransferPage extends StatefulWidget {
  static const routeName = "BankTransferPage";
  const BankTransferPage({Key? key}) : super(key: key);

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
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ActionButton(
            onClick: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: white,
              size: 10,
            ),
          ),
        ),
        title: Text(
          'Банкны шилжүүлэг',
          style: TextStyle(
            color: white,
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
              style: TextStyle(color: white, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: darkGrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Хаан банк: ',
                        style: TextStyle(
                            color: white, fontWeight: FontWeight.w500),
                      ),
                      SelectableText(
                        '2209250401',
                        style: TextStyle(
                            color: white, fontWeight: FontWeight.w500),
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
                            const SnackBar(
                              content: Text('Амжилттай хуулсан'),
                            ),
                          );
                        },
                      );
                    },
                    child: isCopied == false
                        ? Icon(
                            Icons.copy,
                            color: white,
                          )
                        : Icon(
                            Icons.check,
                            color: white,
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
              style: TextStyle(color: white, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: darkGrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectableText(
                    'Зээлийн гэрээний дугаар',
                    style: TextStyle(color: white, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTap = true;
                      });
                      Clipboard.setData(ClipboardData(text: '2209250401')).then(
                        (value) {
                          return ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Амжилттай хуулсан'),
                            ),
                          );
                        },
                      );
                    },
                    child: isTap == false
                        ? Icon(
                            Icons.copy,
                            color: white,
                          )
                        : Icon(
                            Icons.check,
                            color: white,
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
              style: TextStyle(color: white, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: darkGrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectableText(
                    '480,000.00₮',
                    style: TextStyle(color: white, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCopy = true;
                      });
                      Clipboard.setData(ClipboardData(text: '480,000.00')).then(
                        (value) {
                          return ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Амжилттай хуулсан'),
                            ),
                          );
                        },
                      );
                    },
                    child: isCopy == false
                        ? Icon(
                            Icons.copy,
                            color: white,
                          )
                        : Icon(
                            Icons.check,
                            color: white,
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
