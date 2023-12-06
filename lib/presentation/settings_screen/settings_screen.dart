import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/widgets/app_bar/screen_app_bar.dart';
import 'package:financial_assistant/widgets/custom_checkbox_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  bool privacyPolicy = false;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: ScreenAppBar(
        title: 'Settings',
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 33.v),
              decoration: AppDecoration.fillOnBottom
                  .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _menuItem(context,
                      imagePath: ImageConstant.img87ticksquare,
                      title: "Privacy Policy"),
                  SizedBox(height: 42.v),
                  _menuItem(context,
                      imagePath: ImageConstant.img52Chat13,
                      title: "Terms of use"),
                  SizedBox(height: 42.v),
                  _menuItem(context,
                      imagePath: ImageConstant.img24Bag6,
                      title: "Subscription info"),
                  SizedBox(height: 42.v),
                  _menuItem(context,
                      imagePath: ImageConstant.img77Star,
                      title: "Rate app",
                      onTap: () => {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
    BuildContext context, {
    String imagePath = '',
    String title = '',
    Function? onTap,
  }) {
    return InkWell(
      onTap: () => {onTap?.call()},
      child: Row(children: [
        CustomImageView(
            imagePath: imagePath, height: 24.adaptSize, width: 24.adaptSize),
        Padding(
            padding: EdgeInsets.only(left: 15.h, top: 2.v),
            child: Text(title, style: theme.textTheme.bodyMedium))
      ]),
    );
  }

  _launchURL(String url) async {

  }
}
