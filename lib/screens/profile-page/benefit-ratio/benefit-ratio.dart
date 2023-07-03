import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class BenefitRatio extends StatefulWidget {
  static const routeName = 'BenefitRatio';
  const BenefitRatio({Key? key}) : super(key: key);

  @override
  State<BenefitRatio> createState() => _BenefitRatioState();
}

class _BenefitRatioState extends State<BenefitRatio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Өр орлогын харьцаа',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
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
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).splashColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Таны зээлүүд /2023 оны 5-р сарын байдлаар/',
                style: TextStyle(color: Theme.of(context).iconTheme.color),
              ),
              SizedBox(
                height: 200,
              ),
              Divider(
                color: greyDark,
                thickness: 0.3,
              ),
              Text(
                'Цалингийн зээл',
                style: TextStyle(color: Theme.of(context).iconTheme.color),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Таны дундаж цалин',
                      style:
                          TextStyle(color: Theme.of(context).iconTheme.color),
                    ),
                    Text(
                      '1,800,00.00₮',
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: greyDark,
                      thickness: 0.3,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Сарын нийт зээлийн төлбөр',
                      style:
                          TextStyle(color: Theme.of(context).iconTheme.color),
                    ),
                    Text(
                      '0₮',
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: greyDark,
                      thickness: 0.3,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Өр орлогын харьцаа',
                      style:
                          TextStyle(color: Theme.of(context).iconTheme.color),
                    ),
                    Text(
                      '60%',
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: greyDark,
                      thickness: 0.3,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Боломжит зээлийн хэмжээ',
                      style:
                          TextStyle(color: Theme.of(context).iconTheme.color),
                    ),
                    Text(
                      '20,000,000.00₮',
                      style: TextStyle(
                        color: lightgreen,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: greyDark,
                      thickness: 0.3,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
