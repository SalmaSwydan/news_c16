import 'package:flutter/material.dart';
import 'package:news_c16/presentaion/newslist_details_screen/news_list_viewModel.dart';
import 'package:provider/provider.dart';
import '../../api/model/resonse/sources/Source.dart';
import 'ArticlesListWidget.dart' show ArticlesListWidget;

class NewsListView extends StatelessWidget {
  Source source;
  NewsListViewModel vm = NewsListViewModel();
  NewsListView({super.key, required this.source}){
    vm.getArticleBySourceId(source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    print(source.id);
    return ChangeNotifierProvider(create: (context) => vm,
      child: Consumer<NewsListViewModel>(builder: (context, viewModel, child) {
       print(viewModel.state.state);
        var screenState = viewModel.state;
       switch(screenState.state){
         case ScreenState.Initial:
         case ScreenState.Loading:{
         return Center(child: CircularProgressIndicator(),);
         }
         case ScreenState.Error:{
           return Center(child: Text(screenState.errorMessage ?? "Something went wrong"),);
         }
         case ScreenState.Success:{
           return ArticlesListWidget(screenState.articles ?? []);
         }
       }
      },),
    );
  }
}

