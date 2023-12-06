import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/data/data_manager.dart';
import 'package:financial_assistant/models/course_model.dart';
import 'package:financial_assistant/models/news_model.dart';
import 'package:financial_assistant/presentation/home_page/widgets/little_course_list_item_widget.dart';
import 'package:flutter/material.dart';

import '../home_page/widgets/home_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsModel> newsListCurrent = [];
  List<CourseModel> coursesListCurrent = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DataManager.getWallet();
    DataManager.getAllNews().then((List<NewsModel> newsList) {
      setState(() {
        newsListCurrent = newsList;
      });
    });

    DataManager.getRandom3Courses().then((List<CourseModel> courseList) {
      setState(() {
        coursesListCurrent = courseList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.maxFinite,
        decoration: AppDecoration.style,
        child: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            children: [
              _buildTopWidget(context),
              _buildMiddleWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.v),
      decoration: AppDecoration.style,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 38.v),
          Text(
            "Balance",
            style: CustomTextStyles.bodySmallPrimary_1,
          ),
          SizedBox(height: 7.v),
          Text(
            "\$${DataManager.data.totalBalance.toStringAsFixed(2)}",
            style: theme.textTheme.displaySmall,
          ),
          SizedBox(height: 24.v),
        ],
      ),
    );
  }

  Widget _buildMiddleWidget(BuildContext context) {
    return Expanded(
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 30.h),
        decoration: AppDecoration.fillOnMiddle,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 125.h,
              width: double.infinity,// Adjust the height as needed
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: coursesListCurrent.length,
                padding: EdgeInsets.only( left: 17.h, right: 17.h),
                // Change this to the number of items you want
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.h),
                    child: LittleCourseListItemWidget(
                        course: coursesListCurrent[index]),
                  );
                },

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
         height: 100.h,
        decoration: AppDecoration.fillOnBottom,
        child: Column(
          mainAxisSize: MainAxisSize.min,
         // mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News",
                    style: CustomTextStyles.labelMediumOnSecondaryContainer,
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushNamed(
                          context, AppRoutes.navigationBarScreen,
                          arguments: 4)
                    },
                    child: Text(
                      "View all",
                      style: CustomTextStyles.bodySmallUnboundedPrimaryContainer
                          .copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              //flex: 0,
              //padding: EdgeInsets.symmetric(horizontal: 8.h),
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 65.h, left: 17.h, right: 17.h),
                physics: BouncingScrollPhysics(),
                //shrinkWrap: false,
                itemCount: newsListCurrent.length,
                itemBuilder: (context, index) {
                  NewsModel news = newsListCurrent[index];
                  return HomeItemWidget(
                    newsModel: news,
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
}
