import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/models/course_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LittleCourseListItemWidget extends StatelessWidget {
  final CourseModel course;

  const LittleCourseListItemWidget({Key? key, required this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>{
        Navigator.pushNamed(context, AppRoutes.courseViewScreen, arguments: course),
      },
      child: Container(

        width: 250.h,
        decoration: AppDecoration.greyCircle,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: course.imgUrl,
                height: 80.v,
                width: 90.h,
                radius: BorderRadius.circular(
                  15.h,
                ),
                fit: BoxFit.fill,
              ),
            Container(
              padding: EdgeInsets.only(left: 8.h),
              width: 140.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        course.courseName,
                        style: CustomTextStyles.labelLargeSemiBold,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(height: 5.v),
                    Text(
                      "Training completed: ",
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(height: 10.v),
                   LinearProgressIndicator(
                     minHeight: 3.h,
                      backgroundColor: AppDecoration.fillPrimary1.color,
                      color: AppDecoration.style.color,
                      value: 0.5,
                     borderRadius: BorderRadius.all(Radius.circular(30.h)),
                    ),

                  ],
                ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
