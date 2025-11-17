import 'package:flutter/material.dart';

import '../../api/ApiManager.dart';
import '../../api/model/resonse/articles/Articles.dart';

class NewsListViewModel extends ChangeNotifier{
//call api
  //save sources data
  //handle stat for view
  NewsListState state = NewsListState();

  void getArticleBySourceId(String sourceId)async {
//call api
    try {
      _sendState (
          NewsListState(
            state: ScreenState.Loading,
            LoadingMessage: 'Please Wait .....',
          )
      );
      var response = await ApiManager.getInstance().
      getArticles(sourceId);

      if (response.status == 'ok') {
        _sendState(NewsListState(
          state: ScreenState.Success,
          articles: response.articles,
        ));
      } else {
        _sendState(NewsListState(
          state: ScreenState.Error,
          errorMessage: response.message,));
      }
    }catch (e) {
      _sendState(NewsListState(
        state: ScreenState.Error,
        errorMessage: e.toString(),));
    }
  }
  void _sendState(NewsListState newState) {
    state = newState;
    notifyListeners();
  }
}

enum ScreenState{
  Initial,
  Loading,
  Success,
  Error,
}
class NewsListState{
  ScreenState state = ScreenState.Initial;

  List<Article>? articles;

  String? LoadingMessage;
  // incase of error
  String? errorMessage;


  NewsListState({
    this.state = ScreenState.Initial,
    this.articles,
    this.LoadingMessage,
    this.errorMessage,
  });
}