import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/screens/bonus-credit/add-fiends/add-fiends-number.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddFriends extends StatefulWidget {
  static const routeName = "AddFriendsPage";
  const AddFriends({super.key});

  @override
  State<AddFriends> createState() => _AddFriendsState();
}

class _AddFriendsState extends State<AddFriends> {
  bool qwe = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
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
        centerTitle: true,
        title: Text(
          'Найзаа урих',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: SvgPicture.asset(
                      'assets/svg/add-user.svg',
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Таны урьсан найз T-Wallet аппликейшнд амжилттэй бүртгүүлсэн тохиолдолд танд 10 оноо нэмэгдэж орно.',
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(
            //     'Та нэг сарын хугацаанд хамгийн ихдээ 20 найзаа урих боломжтой.',
            //     style: TextStyle(
            //       color: Theme.of(context).iconTheme.color,
            //       fontSize: 15,
            //       fontWeight: FontWeight.w500,
            //     ),
            //     textAlign: TextAlign.justify,
            //     maxLines: 2,
            //   ),
            // ),

            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Урьсан найзууд.',
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            qwe == true
                ? Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).splashColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      '${index + 1}',
                                      style:
                                          TextStyle(color: white, fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      '95731319',
                                      style:
                                          TextStyle(color: white, fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.delete_forever,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(InviteFriends.routeName);
              },
              child: Container(
                height: 42,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: buttonColor),
                child: Center(
                  child: Text(
                    'Найзаа урих',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
