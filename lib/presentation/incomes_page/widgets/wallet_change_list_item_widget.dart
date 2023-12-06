import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/models/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class WalletChangeListItemWidget extends StatelessWidget {
  bool isPositive;

  WalletChangeData data;

  WalletChangeListItemWidget({Key? key, required this.data, this.isPositive = true})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMMM, yyyy').format(data.dateTime);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.h,
        vertical: 10.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.changeDescription,
                style: CustomTextStyles.labelLargeOnPrimaryContainerMedium,
              ),
              SizedBox(height: 5.v),
              Text(
                formattedDate,
                style: CustomTextStyles.bodySmallRegular9,
              ),
            ],
          ),
          Text(
            (isPositive ? '+' : '-') + '${data.changeValue}',
            style: isPositive
                ? CustomTextStyles.labelLargeGreenA700
                : CustomTextStyles.labelLargeRedA700,
          ),
        ],
      ),
    );
  }
}
