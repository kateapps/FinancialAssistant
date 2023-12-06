import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/models/wallet_model.dart';
import 'package:flutter/material.dart';

import '../presentation/incomes_page/widgets/wallet_change_list_item_widget.dart';
import 'custom_elevated_button.dart';
import 'custom_floating_button.dart';

class WalletChangesWidget extends StatefulWidget {
  final String title;
  final String emptyPrimaryInfoText;
  final String emptySecondaryInfoText;
  final String emptyButtonText;
  final Function? onTap;
  final bool positive;
  final List<WalletChangeData> walletChangeList;
  final Future<double> totalFuture;

  const WalletChangesWidget(
      {Key? key,
      required this.walletChangeList,
      required this.totalFuture,
      required this.title,
      this.positive = true,
      required this.emptyButtonText,
      required this.emptyPrimaryInfoText,
      required this.emptySecondaryInfoText,
      this.onTap})
      : super(key: key);

  @override
  State<WalletChangesWidget> createState() => _WalletChangesWidgetState();
}

class _WalletChangesWidgetState extends State<WalletChangesWidget> {
  bool isButtonFloating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<double>(
        future: widget.totalFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingWidget();
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error.toString());
          } else {
            double totalIncome = snapshot.data ?? 0;
            if (totalIncome == 0) {
              return _onDataEmpty(context);
            } else {
              return _onDataExist(context, totalIncome);
            }
          }
        },
      ),

      floatingActionButton: FutureBuilder<double>(
        future: widget.totalFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(); // Placeholder for the FAB while loading
          } else if (snapshot.hasError) {
            // Handle the error
            return Container(); // Placeholder for the FAB if an error occurs
          } else {
            double totalIncomes = snapshot.data ?? 0;
            return totalIncomes == 0
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(bottom: 80.h),
                    child: _buildFloatingActionButton(context),
                  );
          }
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

      //bottomSheet: Container(color: isButtonFloating ? Colors.transparent : AppDecoration.fillOnMiddle.color, height: 120.h),
    );
  }

  Widget _onDataEmpty(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 18.h,
                vertical: 131.v,
              ),
              decoration: AppDecoration.fillOnMiddle.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 99.v),
                  Text(
                    widget.emptyPrimaryInfoText,
                    // "No information on income yet",
                    style: theme.textTheme.labelLarge,
                  ),
                  SizedBox(height: 5.v),
                  Text(
                    widget.emptySecondaryInfoText,
                    //  "Click on the \"Add income\" button",
                    style: CustomTextStyles.bodySmallRegular11,
                  ),
                  SizedBox(height: 35.v),
                  CustomElevatedButton(
                    onPressed: () => {
                      widget.onTap?.call(),
                      /* setState(() {
                        Navigator.pushNamed(context, AppRoutes.incomeAddScreen);
                      }),*/
                    },
                    text: widget.emptyButtonText, // "Add Income",
                    margin: EdgeInsets.only(
                      left: 11.h,
                      right: 12.h,
                    ),
                    leftIcon: Container(
                      margin: EdgeInsets.all(10.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgArrowright,
                        height: 10.adaptSize,
                        width: 10.adaptSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _onDataExist(BuildContext context, double total) {
    isButtonFloating = true;

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 1.v),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 3.v),
          Expanded(
            child: Container(
              // height: 713.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle3974,
                    height: 48.v,
                    width: 375.h,
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 106.v),
                  ),
                  SizedBox(
                    // width: double.maxFinite,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildMiddleWidget(context, total),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiddleWidget(BuildContext context, double total) {
    return Expanded(
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 30.h),
        decoration: AppDecoration.fillOnMiddle,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100.h, // Adjust the height as needed
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 9.v),
                  Text(
                    widget.title, //"Total income amount",
                    style: CustomTextStyles.bodySmallPrimary_1,
                  ),
                  SizedBox(height: 6.v),
                  Text(
                    (widget.positive ? '+' : '-') + '\$${total.toStringAsFixed(2)}',
                    style: theme.textTheme.displaySmall,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            _buildBottomWiget(context),
          ],
        ),
        //height: 200.h,
      ),
    );
  }

  Widget _buildBottomWiget(BuildContext context) {
    return Expanded(
      child: Container(
        // height: 100.h,
        decoration: AppDecoration.fillOnBottom,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              //flex: 0,
              //padding: EdgeInsets.symmetric(horizontal: 8.h),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 20.h, left: 17.h, right: 17.h, bottom:150.h ),
               // physics: BouncingScrollPhysics(),
                //shrinkWrap: false,
                itemCount: widget.walletChangeList.length,
                itemBuilder: (context, index) {
                  WalletChangeData income = widget.walletChangeList[index];
                  return WalletChangeListItemWidget(
                    data: income,
                    isPositive: widget.positive,
                  );
                },
              ),
            ),
            /*    SizedBox(
              height: 60.h,
            ),*/
          ],
        ),
        //height: 200.h,
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return CustomFloatingButton(
      backgroundColor: AppDecoration.style.color,
      onTap: () => {
        widget.onTap?.call(),
      },
      height: 62,
      width: 62,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Text('Error: $error'),
    );
  }
}
