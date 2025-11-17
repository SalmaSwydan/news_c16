import 'package:flutter/material.dart';
import 'package:news_c16/api/ApiManager.dart';
import 'package:news_c16/api/model/resonse/sources/Source.dart';
import '../newslist_details_screen/ArticlesListWidget.dart';
import '../newslist_details_screen/news_list_view.dart';

class NewsSourcesWidget extends StatefulWidget {
  List<Source> tabs;
  NewsSourcesWidget(this.tabs,{super.key});

  @override
  State<NewsSourcesWidget> createState() => _NewsSourcesWidgetState();
}

class _NewsSourcesWidgetState extends State<NewsSourcesWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index){
              setState(() {
                selectedIndex = index;
              });
            },
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            unselectedLabelStyle: TextStyle(fontSize: 15),
            labelStyle: TextStyle(fontSize: 18),
            tabs: widget.tabs.map((source) => Tab(text: source.name)).toList(),
          ),
          Expanded(
            //is NewsListView recreated each time?
            //it uses the same widget and just change source parameter

            child: NewsListView(source: widget.tabs[selectedIndex]),
          ),
        ],
      ),
    );
  }
}
