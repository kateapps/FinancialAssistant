import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/models/course_model.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar/screen_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class CourseViewScreen extends StatelessWidget {
  final CourseModel course;

  const CourseViewScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ScreenAppBar(
          title: 'Education',
        ),
        backgroundColor: theme.colorScheme.primary,
        body: SizedBox(
          width: double.maxFinite,
          //height: 20.h,
          child: Column(
            children: [
              _buildStack(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildColumn(context),
                      SizedBox(height: 13.v),
                      SingleChildScrollView(
                        child: Container(
                            width: 341.h,
                            margin: EdgeInsets.symmetric(horizontal: 17.h),
                            child: Text(course.courseDescription,
                                maxLines: 20,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                style: CustomTextStyles.bodySmallRegular
                                    .copyWith(height: 1.60))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomElevatedButton(
          onPressed: () =>
          {
            Navigator.pushNamed(context, AppRoutes.testScreen, arguments: course.test)
          },
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

  /// Section Widget
  Widget _buildStack(BuildContext context) {
    return Stack(
      children: [
        Container(
          // color: Colors.white,
          height: 313.v,
          width: double.maxFinite,
          child: CustomImageView(
            imagePath: course.imgUrl,
            height: 313.v,
            width: 375.h,
            alignment: Alignment.center,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: 313.v,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 0.4),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 20.v),
      decoration: AppDecoration.fillOnMiddle
          .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3.v),
          Container(
              width: 252.h,
              margin: EdgeInsets.only(right: 87.h),
              child: Text(course.courseName,
                  overflow: TextOverflow.visible,
                  style:
                  CustomTextStyles.titleMediumBold.copyWith(height: 1.50)))
        ],
      ),
    );
  }

}
