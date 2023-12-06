import 'package:financial_assistant/core/app_export.dart';
import 'package:flutter/cupertino.dart';

import 'appbar_leading_image.dart';
import 'appbar_subtitle_one.dart';
import 'custom_app_bar.dart';

class ScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;

  ScreenAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 8.h, right: 8.h),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title:
            AppbarSubtitleOne(text: title, margin: EdgeInsets.only(left: 7.h,)));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }


  @override
  Size get preferredSize => Size(
    mediaQueryData.size.width,
   50.v,
  );
}
