import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TermofPolicyPage extends StatefulWidget {
  static const routeName = "/TermofPolicyPage";
  const TermofPolicyPage({Key? key}) : super(key: key);

  @override
  _TermofPolicyPageState createState() => _TermofPolicyPageState();
}

class _TermofPolicyPageState extends State<TermofPolicyPage>
    with AfterLayoutMixin {
  bool isLoading = true;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Нууцлалын журам",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.close,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
      body: isLoading == false
          ? Container(
              child: SfPdfViewer.asset(
                'assets/svg/term-condition.pdf',
                key: _pdfViewerKey,
              ),
            )
          : CircularProgressIndicator(
              color: buttonColor,
            ),
    );
  }
}
