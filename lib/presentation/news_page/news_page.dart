import 'package:financial_assistant/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../data/data_manager.dart';
import '../../models/news_model.dart';
import '../../widgets/app_bar/main_app_bar.dart';
import '../home_page/widgets/home_item_widget.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  List<NewsModel> newsListCurrent = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DataManager.getAllNews().then((List<NewsModel> newsList) {
      setState(() {
        newsListCurrent = newsList;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(

          body: _buildBottomWiget(context)),
    );
  }

  Widget _buildBottomWiget(BuildContext context) {
    return Container(
      // height: 100.h,
      decoration: AppDecoration.fillOnBottom,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
    );
  }
}
