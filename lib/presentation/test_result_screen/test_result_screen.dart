import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/widgets/app_bar/screen_app_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_elevated_button.dart';

class TestResultScreen extends StatelessWidget {
  final int totalAnswersCount;
  final int correctAnswersCount;

  const TestResultScreen(
      {Key? key,
      required this.totalAnswersCount,
      required this.correctAnswersCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: ScreenAppBar(
        title: 'Test',
      ),
      body: Column(
        children: [
          _buildMiddleWidget(context),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 22.v),
        decoration: AppDecoration.fillOnBottom
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
        child: CustomElevatedButton(
          onPressed: () => _handleContinue(context),
          text: "Continue",
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          leftIcon: Container(
            margin: EdgeInsets.all(10.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgArrowright,
                height: 24.adaptSize,
                width: 24.adaptSize),
          ),
        ),
      ),
    );
  }

  Widget _buildMiddleWidget(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: AppDecoration.fillOnMiddle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
                imagePath: ImageConstant.imgImage11,
                height: 234.v,
                width: 223.h),
            SizedBox(height: 39.v),
            Text("A perfect score ", style: CustomTextStyles.labelLarge_1),
            SizedBox(height: 10.v),
            Text('${correctAnswersCount} / ${totalAnswersCount}',
                style: CustomTextStyles.labelLargePrimaryContainer),
            SizedBox(height: 12.v),
            Container(
                //width: 304.h,
                margin: EdgeInsets.symmetric(horizontal: 15.h),
                child: Text(
                    "We are proud of you! You have shown a great result. Keep up the good work!",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodySmallRegular_1
                        .copyWith(height: 1.48))),
            SizedBox(height: 13.v),
            Container(
                height: 109.v,
               // width: 335.h,
                decoration:
                    BoxDecoration(color: theme.colorScheme.onPrimaryContainer))
          ],
        ),
      ),
    );
  }

  void _handleContinue(BuildContext context) {
    Navigator.pop(context);
  }
}
