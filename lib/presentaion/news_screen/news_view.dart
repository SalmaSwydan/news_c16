import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_c16/api/ApiManager.dart';
import 'package:news_c16/core/resources/widgets/custom_scaffold.dart';
import 'package:news_c16/data/models/category_model.dart';
import 'package:news_c16/presentaion/news_screen/NewsSources.dart';

class NewsView extends StatelessWidget {
  CategoryModel category;
  NewsView(this.category,{super.key});


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      () {
        Navigator.pop(context);
      },
      title: category.title,
      actions: [],
      body: FutureBuilder(future: ApiManager.getInstance()
          .getNewsSources(category.id ?? ""), builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasError){
          return Center(child: Text('Error'),);
        }
        var response = snapshot.data;

        return NewsSourcesWidget(response?.sources ?? []);

          },),
    );
  }
}
