import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/widgets/app_bar/appbar_leading_image.dart';
import 'package:financial_assistant/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:financial_assistant/widgets/app_bar/custom_app_bar.dart';
import 'package:financial_assistant/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../data/data_manager.dart';
import '../../models/wallet_model.dart';
import '../../widgets/app_bar/screen_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class ExpensesAddScreen extends StatefulWidget {
  ExpensesAddScreen({Key? key}) : super(key: key);

  @override
  State<ExpensesAddScreen> createState() => _ExpensesAddScreenState();
}

TextEditingController priceController = TextEditingController();

TextEditingController salaryController = TextEditingController();

FocusNode priceFocus = FocusNode();
FocusNode salaryFocus = FocusNode();

class _ExpensesAddScreenState extends State<ExpensesAddScreen> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: ScreenAppBar(title: "Add expense"),
      body: Container(
        // height: 768.v,
        width: double.maxFinite,
        child: _buildFrame(context),
      ),
      floatingActionButton: checkIsFieldNonEmpty(context),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: AppDecoration.fillOnBottom
          .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 23.v),
          CustomTextFormField(
            controller: priceController,
            focusNode: priceFocus,
            hintText: "Expense amount",
            autofocus: true,
            // focusNode: focusNode,
            textInputType: TextInputType.number,
          ),
          SizedBox(height: 8.v),
          CustomTextFormField(
              controller: salaryController,
              focusNode: salaryFocus,
              hintText: "Expense description",
              textInputAction: TextInputAction.done),
        ],
      ),
    );
  }

  Widget checkIsFieldNonEmpty(BuildContext context) {
    if (priceController.value.text.isNotEmpty) {
      //
      return CustomElevatedButton(
        onPressed: () => {
          setState(() {
            DataManager.addToExpensesList(
              WalletChangeData(
                  changeValue: double.parse(priceController.value.text),
                  changeDescription: salaryController.value.text,
                  dateTime: DateTime.now()),
            );
          }

          ),
          Navigator.pop(context),
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
      );
    } else
      return Container();
  }
}
