import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class OnboardingTwoBottomsheet extends StatelessWidget {
  const OnboardingTwoBottomsheet({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return _buildFeedbackFrame(context);
  }

  /// Section Widget
  Widget _buildFeedbackFrame(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 31.h,
          vertical: 26.v,
        ),
        decoration: AppDecoration.fillOnBottom.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 13.v),
            Text(
              "We value your feedback",
              style: CustomTextStyles.titleMediumOnPrimaryContainer,
            ),
            SizedBox(height: 32.v),
            SizedBox(
              width: 308.h,
              child: Text(
                "Every day we are getting better due to your ratings and reviews — that helps us protect your accounts.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodySmallRegular11.copyWith(
                  height: 1.50,
                ),
              ),
            ),
            SizedBox(height: 42.v),
            CustomElevatedButton(
              text: "Continue",
              leftIcon: Container(
                margin: EdgeInsets.only(right: 30.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowright,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ),
            ),
            SizedBox(height: 34.v),
            SizedBox(
              width: 136.h,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "\n",
                      style: CustomTextStyles.bodySmallBlack9003f.copyWith(
                        height: 1.55,
                      ),
                    ),
                    TextSpan(
                      text: "Terms of use",
                      style: CustomTextStyles.bodySmallGray40001Regular,
                    ),
                    TextSpan(
                      text: "  |  ",
                      style: CustomTextStyles.bodySmallBlack9003f,
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: CustomTextStyles.bodySmallGray40001Regular,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
