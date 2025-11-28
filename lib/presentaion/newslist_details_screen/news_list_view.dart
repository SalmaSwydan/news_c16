import 'package:flutter/material.dart';
import 'package:news_c16/presentaion/newslist_details_screen/news_list_viewModel.dart';
import 'package:provider/provider.dart';
import '../../api/model/resonse/sources/Source.dart';
import 'ArticlesListWidget.dart' show ArticlesListWidget;

class NewsListView extends StatelessWidget {
  final Source source;
  late NewsListViewModel vm;
  NewsListView({required this.source, Key? key}) :super(key: key) {
    vm = NewsListViewModel();
    vm.getArticleBySourceId(source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<NewsListViewModel>(
        builder: (context, viewModel, child) {
        var screenState = viewModel.state;
        switch (screenState.state) {
          case ScreenState.Initial:
          case ScreenState.Loading:
            {
              return Center(child: CircularProgressIndicator(),);
            }
          case ScreenState.Error:
            {
              return Center(child: Text(
                  screenState.errorMessage ?? "Something went wrong"),);
            }
          case ScreenState.Success:
            {
              return ArticlesListWidget(screenState.articles ?? []);
            }
        }
      },),
    );
  }
}