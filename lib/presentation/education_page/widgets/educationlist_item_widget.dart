import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/models/course_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EducationlistItemWidget extends StatelessWidget {
  final CourseModel courseModel;

  const EducationlistItemWidget({Key? key, required this.courseModel})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
      Navigator.pushNamed(context, AppRoutes.courseViewScreen, arguments: courseModel),
    },
      child: Container(
        padding: EdgeInsets.only(
          top: 10.v,
          bottom: 10.v,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomImageView(
              imagePath: courseModel.imgUrl,
              height: 88.v,
              width: 106.h,
              fit: BoxFit.fill,
              radius: BorderRadius.circular(10),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 11.v,
                bottom: 20.v,
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 210.h,
                    child: Text(
                      courseModel.courseName,
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                  SizedBox(height: 7.v),
                  SizedBox(
                    width: 210.h,
                    child: Text(
                      courseModel.courseDescription,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
