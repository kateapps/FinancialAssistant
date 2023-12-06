import 'package:financial_assistant/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewslistItemWidget extends StatelessWidget {
  const NewslistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgVector2,
          height: 88.v,
          width: 106.h,
          radius: BorderRadius.circular(
            5.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 11.v,
            bottom: 20.v,
          ),
          child: Column(
            children: [
              Text(
                "Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et.",
                style: theme.textTheme.labelMedium,
              ),
              SizedBox(height: 7.v),
              SizedBox(
                width: 210.h,
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
