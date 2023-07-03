import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/get.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/utils/utils.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PotentialBalanceCard extends StatefulWidget {
  final Customer? customer;
  final Function()? onClick;
  final bool? isLoading;
  final Get? data;
  final bool? button;
  const PotentialBalanceCard({
    this.customer,
    this.data,
    this.button,
    Key? key,
    this.onClick,
    this.isLoading,
  }) : super(key: key);

  @override
  State<PotentialBalanceCard> createState() => _PotentialBalanceCardState();
}

class _PotentialBalanceCardState extends State<PotentialBalanceCard> {
  bool isView = false;

  @override
  Widget build(BuildContext context) {
    isView = Provider.of<UserProvider>(context, listen: true).isView;

    return Container(
      width: MediaQuery.of(context).size.width - 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).splashColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    '${widget.customer?.loanProduct?.name}',
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'Боломжит үлдэгдэл',
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                isView == false
                    ? Center(
                        child: Text(
                          "${Utils().formatCurrency(widget.customer?.balance)}₮",
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          '*******',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          GestureDetector(
            onTap: widget.onClick,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 17),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: widget.customer?.balance == "0.00" &&
                        widget.customer?.loanAmount == "0.00"
                    ? Colors.amber
                    : buttonColor,
              ),
              child: widget.customer?.balance == "0.00" &&
                      widget.customer?.loanAmount == "0.00"
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.isLoading == true
                            ? Center(
                                child: SizedBox(
                                  child: CircularProgressIndicator(
                                    color: darkGrey,
                                    strokeWidth: 2,
                                  ),
                                  height: 15,
                                  width: 15,
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          width: 5,
                        ),
                        Center(
                          child: Text(
                            'Зээлийн эрх шинэчлэх',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )
                  : Center(
                      child: Text(
                        'Зээл авах',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
