import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/data/data_manager.dart';
import 'package:flutter/material.dart';

import '../../models/course_model.dart';
import '../education_page//widgets/educationlist_item_widget.dart';
import '../home_page/widgets/little_course_list_item_widget.dart';

class EducationPage extends StatefulWidget {
  EducationPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  List<CourseModel> randomCourses = [];
  List<CourseModel> allCourses = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DataManager.getWallet();
    DataManager.getAllCourse().then((List<CourseModel> courseList) {
      setState(() {
        allCourses = courseList;
      });
    });

    DataManager.getRandom3Courses().then((List<CourseModel> courseList) {
      setState(() {
        randomCourses = courseList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: SizedBox(
        width: mediaQueryData.size.width,
        child: _buildMiddleWidget(context),
      ),
    );
  }

  Widget _buildMiddleWidget(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 30.h),
      decoration: AppDecoration.fillOnMiddle,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 100.h, // Adjust the height as needed
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: randomCourses.length,
              padding: EdgeInsets.only(left: 17.h, right: 17.h),
              // Change this to the number of items you want
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  child:
                      LittleCourseListItemWidget(course: randomCourses[index]),
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
    );
  }

  Widget _buildBottomWiget(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100.h,
        decoration: AppDecoration.fillOnBottom,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Courses",
                    style: CustomTextStyles.labelMediumOnSecondaryContainer,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.v),
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
              //padding: EdgeInsets.symmetric(horizontal: 8.h),
              child: ListView.builder(
                padding:
                    EdgeInsets.only(bottom: 65.h, left: 17.h, right: 17.h),
                physics: BouncingScrollPhysics(),
                shrinkWrap: false,
                itemCount: allCourses.length,
                itemBuilder: (context, index) {
                  return EducationlistItemWidget(
                    courseModel: allCourses[index],
                  );
                },
              ),
            ),

          ],
        ),
        //height: 200.h,
      ),
    );
  }
}
