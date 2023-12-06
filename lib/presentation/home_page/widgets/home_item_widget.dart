import 'package:financial_assistant/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../models/news_model.dart';

// ignore: must_be_immutable
class HomeItemWidget extends StatelessWidget {
  NewsModel newsModel;

  HomeItemWidget({Key? key, required this.newsModel})
      : super(
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>
      {
        Navigator.pushNamed(
            context!, AppRoutes.newsViewScreen, arguments: newsModel),

    //  Navigator.pushNamed(context!, AppRoutes.newsViewScreen, arguments: newsModel),
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 10.v,
          bottom: 10.v,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: newsModel.urlToImage,
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
                children: [
                  SizedBox(
                    width: 210.h,
                    child: Text(
                      newsModel.title,
                      style: theme.textTheme.labelMedium,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  SizedBox(height: 7.v),
                  SizedBox(
                    width: 210.h,
                    child: Text(
                      newsModel.description,
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
