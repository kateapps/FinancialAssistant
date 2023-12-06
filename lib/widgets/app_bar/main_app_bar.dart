import 'package:financial_assistant/core/app_export.dart';
import 'package:flutter/material.dart';

import 'appbar_image.dart';
import 'appbar_subtitle.dart';
import 'appbar_subtitle_two.dart';
import 'appbar_trailing_image.dart';
import 'custom_app_bar.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;

  MainAppBar({required this.title, required this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomAppBar(
      height: 80.v,
      title: AppbarSubtitle(
        text: title,
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(
            left: 15.h,
            top: 25.v,
            bottom: 25.v,
            right: 8.h,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 6.h,
            vertical: 4.v,
          ),
          decoration: AppDecoration.fillOnBottom.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder14,
          ),
          child: InkWell(
            onTap: () {
              print('lol');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppbarImage(
                  imagePath: ImageConstant.imgImage4,
                ),
                AppbarSubtitleTwo(
                  text: "15",
                  margin: EdgeInsets.fromLTRB(7.h, 1.v, 1.h, 2.v),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8.h, 8.v, 23.h, 8.v),
          child: Container(
            height: 30.h,
            width: 30.h,
            child: AppbarTrailingImage(
              imagePath: ImageConstant.img44Setting,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.settingsScreen);
              },
              // margin: EdgeInsets.fromLTRB(8.h, 8.v, 23.h, 8.v),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(
        mediaQueryData.size.width,
        height ?? 56.v,
      );
}
