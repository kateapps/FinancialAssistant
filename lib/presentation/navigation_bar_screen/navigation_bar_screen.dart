import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/presentation/education_page/education_page.dart';
import 'package:financial_assistant/presentation/expenses_page/expenses_page.dart';
import 'package:financial_assistant/presentation/home_page/home_page.dart';
import 'package:financial_assistant/presentation/incomes_page/incomes_page.dart';
import 'package:financial_assistant/presentation/news_page/news_page.dart';
import 'package:financial_assistant/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class NavigationBarScreen extends StatelessWidget {
  NavigationBarScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.homePage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.h),
                child: _buildBottomBar(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Education:
        return AppRoutes.educationPage;
      case BottomBarEnum.Income:
        return AppRoutes.incomesPage;
      case BottomBarEnum.Expense:
        return AppRoutes.expensesPage;
      case BottomBarEnum.News:
        return AppRoutes.newsPage;

    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    print(currentRoute);
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.educationPage:
        return EducationPage();
      case AppRoutes.incomesPage:
        return IncomesPage();
      case AppRoutes.expensesPage:
        return ExpensesPage();
      case AppRoutes.newsPage:
        return NewsPage();
      default:
        return DefaultWidget();
    }
  }
}
