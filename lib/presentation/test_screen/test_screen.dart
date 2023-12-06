import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/widgets/app_bar/screen_app_bar.dart';
import 'package:financial_assistant/widgets/custom_checkbox.dart';
import 'package:financial_assistant/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../models/test_model.dart';
import '../../widgets/custom_segmented_progress_bar.dart';

class TestScreen extends StatefulWidget {
  final TestModel test;

  const TestScreen({Key? key, required this.test}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int currentPage = 0;
  int currentQuestionIndex = 0;
  List<QuestionModel> questions = [];
  int currentAnswer = -1;

  int rightAnswer = -1;

  int rightAnswerTotal = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questions = widget.test.questions;
    currentAnswer = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: 'Test',
      ),
      body: Column(
        children: [
          _buildMiddleWidget(context),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 22.v),
        decoration: AppDecoration.fillOnBottom
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
        child: CustomElevatedButton(
          onPressed: _handleContinue,
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

  Widget _buildMiddleWidget(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: AppDecoration.fillOnMiddle,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30.h,
            ),
            _buildProgress(context),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 100.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  questions[currentQuestionIndex].questionText,
                  style: theme.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: _buildQuestionWidget(questions[currentQuestionIndex]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgress(BuildContext context) {
    return CustomSegmentedProgressBar(
      index: currentQuestionIndex,
      count: questions.length,
    );
  }

  Widget _buildQuestionWidget(QuestionModel question) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: question.options.length,
        itemBuilder: (context, index) {
          String option = question.options[index];
          rightAnswer = question.correctOptionIndex;
          return ListTile(
            title: CustomCheckbox(
              title: option,
              height: 75.h,
              isChecked: currentAnswer == index,
              onChanged: (_) {
                setState(() {
                  currentAnswer = index;
                });

                print(currentAnswer);
              },
            ),
          );
        },
      ),
    );
  }

  void _handleContinue() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        if (rightAnswer == currentAnswer) {
          rightAnswerTotal++;
        }
        currentAnswer = -1;
        currentQuestionIndex++;

        print(rightAnswerTotal);
      });
    } else {
      // Все вопросы пройдены, открываем экран результатов
      _showResultsScreen();
    }
  }

  void _showResultsScreen() {
    Navigator.pushReplacementNamed(context, AppRoutes.testResultScreens,
    arguments: {
    'totalAnswersCount': questions.length,
    'correctAnswersCount': rightAnswerTotal,
    },);
  }
}
