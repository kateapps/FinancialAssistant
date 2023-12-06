import 'package:financial_assistant/models/course_model.dart';
import 'package:financial_assistant/models/test_model.dart';
import 'package:financial_assistant/presentation/course_view_screen/course_view_screen.dart';
import 'package:financial_assistant/presentation/education_page/education_page.dart';
import 'package:financial_assistant/presentation/expenses_add_screen/expenses_add_screen.dart';
import 'package:financial_assistant/presentation/expenses_page/expenses_page.dart';
import 'package:financial_assistant/presentation/income_add_screen/income_add_screen.dart';
import 'package:financial_assistant/presentation/launch_screen/launch_screen.dart';
import 'package:financial_assistant/presentation/navigation_screen.dart';
import 'package:financial_assistant/presentation/onboarding_one_screen/onboarding_one_screen.dart';
import 'package:financial_assistant/presentation/settings_screen/settings_screen.dart';
import 'package:financial_assistant/presentation/test_result_screen/test_result_screen.dart';
import 'package:financial_assistant/presentation/test_screen/test_screen.dart';
import 'package:flutter/material.dart';

import '../models/news_model.dart';
import '../presentation/incomes_page/incomes_page.dart';
import '../presentation/news_page/news_page.dart';
import '../presentation/news_view_screen/news_view_screen.dart';

class AppRoutes {
  static const String launchScreen = '/launch_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String homePage = '/home_page';

  static const String navigationBarScreen = '/navigation_bar_screen';

  static const String courseViewScreen = '/course_view_screen';

  static const String educationPage = '/education_page';

  static const String testScreen = '/test_screen';

  static const String testResultScreens = '/test_result_screen';

  static const String incomesPage = '/incomes_page';

  static const String incomeAddTwoScreen = '/income_add_two_screen';

  static const String incomeAddScreen = '/income_add_screen';

  static const String expensesPage = '/expenses_page';

  static const String expensesAddScreen = '/expenses_add_screen';

  static const String newsViewScreen = '/news_view_screen';

  static const String newsPage = '/news_page';

  static const String settingsScreen = '/settings_screen';

  static Map<String, WidgetBuilder> routes = {
    launchScreen: (context) => LaunchScreen(),
    onboardingOneScreen: (context) => OnboardingOneScreen(),
    navigationBarScreen: (context) {
      // Retrieve the NewsModel parameter
      final args = (ModalRoute.of(context)!.settings.arguments ?? 0) as int;
      return NavigationScreen(indexToRoute: args );
    },
    courseViewScreen: (context) {
      // Retrieve the NewsModel parameter
      final args = ModalRoute.of(context)!.settings.arguments as CourseModel;
      return CourseViewScreen(course: args);
    },
    educationPage: (context) => EducationPage(),
    testScreen: (context) {
      // Retrieve the NewsModel parameter
      final args = ModalRoute.of(context)!.settings.arguments as TestModel;
      return TestScreen(test: args);
    },
    testResultScreens: (context) {
      // Retrieve the arguments as a Map<String, int>
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, int>;

      // Extract the values using the keys
      final totalAnswersCount = args['totalAnswersCount'];
      final correctAnswersCount = args['correctAnswersCount'];

      // Pass the values to the TestResultScreen widget
      return TestResultScreen(
        totalAnswersCount: totalAnswersCount ?? 0,
        correctAnswersCount: correctAnswersCount ?? 0,
      );
    },
    incomesPage: (context) => IncomesPage(),
    incomeAddScreen: (context) => IncomeAddScreen(),
    expensesPage: (context) => ExpensesPage(),
    expensesAddScreen: (context) => ExpensesAddScreen(),
    newsViewScreen: (context) {
      // Retrieve the NewsModel parameter
      final args = ModalRoute.of(context)!.settings.arguments as NewsModel;
      return NewsViewScreen(newsModel: args);
    },
    newsPage: (context) => NewsPage(),
    settingsScreen: (context) => SettingsScreen(),
  };
}
