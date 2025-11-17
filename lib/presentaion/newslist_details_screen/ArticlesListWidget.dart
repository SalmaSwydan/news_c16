import 'package:flutter/material.dart';
import 'package:news_c16/api/model/resonse/articles/Articles.dart';
import 'package:news_c16/presentaion/newslist_details_screen/widgets/news_card.dart';

class ArticlesListWidget extends StatelessWidget {
  List<Article> articles;
  ArticlesListWidget(this.articles,{super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        var article = articles[index];
        return NewsCard(articleModel: article);
      },
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: articles.length,
    );
  }
}
