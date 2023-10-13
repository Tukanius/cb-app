import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/notification-page/notification-page.dart';
import 'package:bank_core/screens/profile-page/profile-page-for-drawer.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

// class _ShopPageState extends State<ShopPage>
//     with SingleTickerProviderStateMixin {
//   CarouselController carouselController = CarouselController();
//   late TabController tabController;
//   int currentIndex = 0;

//   void initState() {
//     tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverToBoxAdapter(
//               child: Container(
//                 margin: EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: darkGrey,
//                 ),
//                 child: TabBar(
//                   unselectedLabelColor: Colors.grey,
//                   indicatorColor: white,
//                   indicator: UnderlineTabIndicator(
//                       insets: EdgeInsets.symmetric(horizontal: 16.0)),
//                   labelColor: white,
//                   tabs: [
//                     Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15)),
//                       child: Tab(
//                         child: Container(
//                           margin: EdgeInsets.symmetric(vertical: 10),
//                           child: Text(
//                             'Бараа бүтээгдэхүүн',
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       child: Tab(
//                         child: Container(
//                           margin: EdgeInsets.symmetric(vertical: 10),
//                           child: Text(
//                             'Компани',
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ];
//         },
//         body: TabBarView(
//           physics: NeverScrollableScrollPhysics(),
//           children: [
//             Product(),
//             Company(),
//           ],
//         ),
//       ),
class _ShopPageState extends State<ShopPage> {
  CarouselController carouselController = CarouselController();
  bool isLoading = true;
  bool isView = false;
  bool isDarkMode = false;
  User user = User();
  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: true).user;
    isView = Provider.of<UserProvider>(context, listen: true).isView;
    isDarkMode = Provider.of<UserProvider>(context, listen: true).check;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: CustomDrawer(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 56,
            automaticallyImplyLeading: false,
            pinned: false,
            snap: true,
            floating: true,
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
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Дэлгүүр',
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Lottie.asset('assets/lottie/empty.json', height: 150),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Гүйлгээний түүх хоосон байна",
                  style: TextStyle(
                    color: Theme.of(context).disabledColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // SafeArea(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 10,
      //       ),
      //       CustomAppBar(),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Container(
      //         padding: EdgeInsets.symmetric(horizontal: 15),
      //         width: MediaQuery.of(context).size.width,
      //         child: Text(
      //           'Дэлгүүр',
      //           style: TextStyle(
      //             color: Theme.of(context).iconTheme.color,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         child: Column(
      //           children: [
      //             SizedBox(
      //               height: 15,
      //             ),
      //             Lottie.asset('assets/lottie/empty.json', height: 100),
      //             SizedBox(
      //               height: 15,
      //             ),
      //             Text(
      //               "Дэлгүүр одоогоор хоосон байна",
      //               style: TextStyle(color: Theme.of(context).disabledColor),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
// CustomScrollView(
            //   slivers: <Widget>[
            //     SliverToBoxAdapter(
            //       child: Container(
            //         height: 500,
            //         padding: EdgeInsets.symmetric(vertical: 15),
            //         child: Column(
            //           children: [
            //             Column(
            //               children: [
            //                 // CarouselSlider(
            //                 //   carouselController: carouselController,
            //                 //   options: CarouselOptions(
            //                 //     height: 200.0,
            //                 //     autoPlay: true,
            //                 //     onPageChanged: (index, reason) {
            //                 //       setState(() {
            //                 //         _current = index;
            //                 //       });
            //                 //     },
            //                 //   ),
            //                 //   items: imgList.map((data) {
            //                 //     return Builder(
            //                 //       builder: (BuildContext context) {
            //                 //         return Container(
            //                 //           width: MediaQuery.of(context).size.width,
            //                 //           margin: EdgeInsets.symmetric(horizontal: 5.0),
            //                 //           decoration: BoxDecoration(
            //                 //             borderRadius: BorderRadius.circular(10),
            //                 //             image: DecorationImage(
            //                 //               image: NetworkImage(data),
            //                 //             ),
            //                 //           ),
            //                 //           alignment: Alignment.center,
            //                 //         );
            //                 //       },
            //                 //     );
            //                 //   }).toList(),
            //                 // ),
            //                 // SizedBox(
            //                 //   height: 8,
            //                 // ),
            //                 // Row(
            //                 //   mainAxisAlignment: MainAxisAlignment.center,
            //                 //   children: imgList.asMap().entries.map((entry) {
            //                 //     return GestureDetector(
            //                 //       onTap: () =>
            //                 //           carouselController.animateToPage(entry.key),
            //                 //       child: Container(
            //                 //         width: 10.0,
            //                 //         height: 10.0,
            //                 //         margin: EdgeInsets.symmetric(
            //                 //             vertical: 8.0, horizontal: 4.0),
            //                 //         decoration: BoxDecoration(
            //                 //             shape: BoxShape.circle,
            //                 //             color: _current == entry.key
            //                 //                 ? buttonColor
            //                 //                 : darkGrey),
            //                 //       ),
            //                 //     );
            //                 //   }).toList(),
            //                 // ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),