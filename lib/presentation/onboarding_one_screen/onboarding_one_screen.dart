import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/widgets/custom_elevated_button.dart';
import 'package:financial_assistant/widgets/custom_segmented_progress_bar.dart';
import 'package:flutter/material.dart';

class OnboardingOneScreen extends StatefulWidget {
  const OnboardingOneScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingOneScreen> createState() => _OnboardingOneScreenState();
}

class _OnboardingOneScreenState extends State<OnboardingOneScreen> {
  int currentPage = 0;
  PageController pageController = PageController();

  List<Map<String, String>> onboardingData = [
    {
      'image': ImageConstant.imgImage12,
      'headText': "Your Financial Education Hub!",
      'descText':
          "Financial literacy is the key to unlocking your financial potential",
    },
    {
      'image': ImageConstant.imgReview,
      'headText': "We value your feedback",
      'descText':
          "Every day we are getting better due to your ratings and reviews — that helps us protect your accounts.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 50.v),
          _buildFrameRow(context),
          SizedBox(height: 12.v),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) => _buildImage(
                context,
                onboardingData[index]['image'] ?? '',
              ),
            ),
          ),
          Expanded(
            child: Column(
            //  mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               Container(
                    height: 18.v,
                    width: 306.h,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimaryContainer)),
                _buildOnboardingColumn(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomImageView(
          imagePath: imagePath, height: 24.adaptSize, width: 24.adaptSize),
    );
  }

  /// Section Widget
  Widget _buildFrameRow(BuildContext context) {
    return Container(
      height: 10.v,
      width: 250.h,
      // margin: EdgeInsets.only(top: 20.v, bottom: 40.v),
      child: CustomSegmentedProgressBar(
        activeColor: theme.colorScheme.primaryContainer,
        //padding: EdgeInsets.only(bottom: 50.h, top: 50.h),
        count: 2,
        index: currentPage,
      ),
    );
  }

  /// Section Widget
  Widget _buildOnboardingColumn(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 26.v),
        decoration: AppDecoration.fillOnBottom
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 11.v),
              Text(onboardingData[currentPage]['headText'] ?? '',
                  style: CustomTextStyles.titleMediumOnPrimaryContainer),
              SizedBox(height: 34.v),
              Container(
                  width: 300.h,
                  margin: EdgeInsets.only(left: 6.h, right: 5.h),
                  child: Text(onboardingData[currentPage]['descText'] ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallRegular11
                          .copyWith(height: 1.50))),
              SizedBox(height: 42.v),
              CustomElevatedButton(
                  text: "Continue",
                  leftIcon: Container(
                      margin: EdgeInsets.only(right: 10.h, left: 10.h),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgArrowright,
                          height: 24.adaptSize,
                          width: 24.adaptSize)),
                  onPressed: () {
                    navigateToOnboarding(context);
                  }),
              SizedBox(height: 20.v),
              SizedBox(
                  width: 136.h,
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "\n",
                            style: CustomTextStyles.bodySmallBlack9003f
                                .copyWith(height: 1.55)),
                        TextSpan(
                            text: "Terms of use",
                            style: CustomTextStyles.bodySmallGray40001Regular),
                        TextSpan(
                            text: "  |  ",
                            style: CustomTextStyles.bodySmallBlack9003f),
                        TextSpan(
                            text: "Privacy Policy",
                            style: CustomTextStyles.bodySmallGray40001Regular)
                      ]),
                      textAlign: TextAlign.center))
            ]));
  }

  /// Navigates to the educationScreen when the action is triggered.
  navigateToOnboarding(BuildContext context) {
    if (currentPage == onboardingData.length - 1) {
      Navigator.pushNamed(context, AppRoutes.navigationBarScreen, arguments: 0);
    } else {
      // Переход на следующую стадию
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }
}
