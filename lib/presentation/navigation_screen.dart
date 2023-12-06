import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/presentation/education_page/education_page.dart';
import 'package:financial_assistant/presentation/expenses_page/expenses_page.dart';
import 'package:financial_assistant/presentation/home_page/home_page.dart';
import 'package:financial_assistant/presentation/incomes_page/incomes_page.dart';
import 'package:financial_assistant/presentation/news_page/news_page.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar/main_app_bar.dart';
import '../widgets/custom_bottom_bar.dart';

class NavigationScreen extends StatefulWidget {
  late final int indexToRoute;
  final List<Widget> screens = [
    const HomePage(),
    EducationPage(),
    IncomesPage(),
    ExpensesPage(),
    const NewsPage(),
  ];

  NavigationScreen({key, this.indexToRoute = 0});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late int _currentIndex = widget.indexToRoute;
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHomeDisabled,
      activeIcon: ImageConstant.imgHomeEnabled,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgEducationDisabled,
      activeIcon: ImageConstant.imgEducationEnabled,
      type: BottomBarEnum.Education,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgIncomeDisabled,
      activeIcon: ImageConstant.imgIncomeEnabled,
      type: BottomBarEnum.Income,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgExpenseDisabled,
      activeIcon: ImageConstant.imgExpenseEnabled,
      type: BottomBarEnum.Expense,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNewsDisabled,
      activeIcon: ImageConstant.imgNewsEnabled,
      type: BottomBarEnum.News,
    )
  ];
  late final _theme = Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: _buildAppBarTitle(),
        height: 80.v,
      ),
      body: // widget.screens[_currentIndex],
          Stack(
        children: [
          widget.screens[_currentIndex],
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

    );
  }
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      _currentIndex = type.index;
      setState(() {});
     // Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  String _buildAppBarTitle() {
    String title = '';
    switch (_currentIndex) {
      case 0:
        title = "Welcome to your\nFinancial assistant";

        break;
      case 1:
        title = "Let`s start your\neducation";

        break;
      case 2:
        title = "Take control\nyour income";
        break;
      case 3:
        title = "Take control\nyour expenses";
        break;
      case 4:
        title = "Follow\nbusiness news";
        break;
      default:
        break;
    }

    return title;
  }
}
