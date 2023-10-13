import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/notification-page/notification-page.dart';
import 'package:bank_core/screens/transaction-history/all-history.dart';
import 'package:bank_core/screens/transaction-history/loan-history.dart';
import 'package:bank_core/screens/transaction-history/paid-loan-history.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';

class HistoryPage extends StatefulWidget {
  static const routeName = 'HistoryPage';
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  User user = User();
  bool isView = false;
  bool isDarkMode = false;
  int currentIndex = 0;
  int page = 1;
  int limit = 10;
  Result transactionList = Result(rows: [], count: 0);
  bool isLoading = true;
  DateTime? startDate;
  DateTime? endDate;
  String? datestart;
  String? dateend;

  late TabController tabController;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.index = currentIndex;
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  changePage(index) {
    setState(() {
      tabController.index = index;
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: true).user;
    isView = Provider.of<UserProvider>(context, listen: true).isView;
    isDarkMode = Provider.of<UserProvider>(context, listen: true).check;

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 56,
            automaticallyImplyLeading: false,
            pinned: false,
            snap: true,
            floating: true,
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.background,
            title: GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/avatar.svg',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Сайн уу? 👋',
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '${user.firstName}',
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              ActionButton(
                icon: isDarkMode == false
                    ? SvgPicture.asset(
                        "assets/svg/dark-mode.svg",
                        height: 24,
                        width: 24,
                        color: white,
                      )
                    : SvgPicture.asset(
                        "assets/svg/dark-mode.svg",
                        height: 24,
                        width: 24,
                        color: black,
                      ),
                onClick: () {
                  Provider.of<UserProvider>(context, listen: false)
                      .toggleDarkMode(!isDarkMode);
                  final provider =
                      Provider.of<UserProvider>(context, listen: false);
                  provider.toggleTheme(!provider.isDarkMode);
                  print(!provider.isDarkMode);
                },
              ),
              SizedBox(
                width: 10,
              ),
              ActionButton(
                icon: isView == false
                    ? Icon(
                        Icons.visibility,
                        color: Theme.of(context).hoverColor,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: Theme.of(context).hoverColor,
                      ),
                onClick: () async {
                  await Provider.of<UserProvider>(context, listen: false)
                      .setView(!isView);
                },
              ),
              SizedBox(
                width: 10,
              ),
              ActionButton(
                onClick: () {
                  Navigator.of(context).pushNamed(NotificationPage.routeName);
                },
                icon: Icon(
                  Icons.notifications,
                  color: Theme.of(context).hoverColor,
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 110),
              child: Column(
                children: [
                  Container(
                    child: GestureDetector(
                      onTap: () async {
                        showCustomDateRangePicker(
                          context,
                          dismissible: true,
                          startDate: startDate,
                          endDate: endDate,
                          minimumDate:
                              DateTime.now().subtract(const Duration(days: 90)),
                          maximumDate: DateTime.now(),
                          onApplyClick: (start, end) {
                            setState(() {
                              endDate = end;
                              startDate = start;
                            });
                            datestart =
                                DateFormat('yyyy-MM-dd').format(startDate!);
                            dateend = DateFormat('yyyy-MM-dd').format(endDate!);
                          },
                          onCancelClick: () {
                            setState(() {
                              endDate = null;
                              startDate = null;
                              datestart = null;
                              dateend = null;
                            });
                          },
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          primaryColor: buttonColor,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).splashColor,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              child: Row(
                                children: [
                                  datestart == null
                                      ? Text(
                                          DateFormat('yyyy-MM-dd').format(
                                            DateTime.now(),
                                          ),
                                          style: TextStyle(fontSize: 15),
                                        )
                                      : Text(
                                          '${datestart}',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.calendar_month,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).splashColor,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              child: Row(
                                children: [
                                  dateend == null
                                      ? Text(
                                          DateFormat('yyyy-MM-dd')
                                              .format(DateTime.now()),
                                          style: TextStyle(fontSize: 15),
                                        )
                                      : Text(
                                          '${dateend}',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.calendar_month,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).splashColor),
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 45,
                          decoration: tabController.index == 0
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: buttonColor),
                                  ),
                                )
                              : BoxDecoration(),
                          child: GestureDetector(
                            onTap: () {
                              changePage(0);
                            },
                            child: Center(
                              child: Text(
                                'Бүгд',
                                style: TextStyle(
                                  fontSize: tabController.index == 0 ? 18 : 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          decoration: tabController.index == 1
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: buttonColor),
                                  ),
                                )
                              : BoxDecoration(),
                          child: GestureDetector(
                            onTap: () {
                              changePage(1);
                            },
                            child: Center(
                              child: Text(
                                'Орлого',
                                style: TextStyle(
                                  fontSize: tabController.index == 1 ? 18 : 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          decoration: tabController.index == 2
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: buttonColor),
                                  ),
                                )
                              : BoxDecoration(),
                          child: GestureDetector(
                            onTap: () {
                              changePage(2);
                            },
                            child: Center(
                              child: Text(
                                'Зарлага',
                                style: TextStyle(
                                  fontSize: tabController.index == 2 ? 18 : 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          startDate == null
              ? Center(
                  child: Text('Хугацаагаа сонгоно уу.'),
                )
              : AllHistoryPage(
                  startDate: datestart,
                  endDate: dateend,
                ),
          startDate == null
              ? Center(
                  child: Text('Хугацаагаа сонгоно уу.'),
                )
              : LoanHistory(
                  startDate: datestart,
                  endDate: dateend,
                ),
          startDate == null
              ? Center(
                  child: Text('Хугацаагаа сонгоно уу.'),
                )
              : PaidHistory(
                  startDate: datestart,
                  endDate: dateend,
                ),
        ],
      ),
    );
  }
}
