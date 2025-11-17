import 'package:flutter/foundation.dart';
import 'package:news_c16/api/ApiManager.dart';

import '../../api/model/resonse/sources/Source.dart';

//provider(notify listener)

class CategoryDetailsViewModel extends ChangeNotifier
{
  //call api
  //save sources data
  //handle stat for view
CategoryDetailsState state = CategoryDetailsState();

void getNewsSources(String categoryId)async {
//call api
  try {
    _sendState (
        CategoryDetailsState(
      state: ScreenState.Loading,
      LoadingMessage: 'Please Wait .....',
    )
    );
    var response = await ApiManager.getInstance().
    getNewsSources(categoryId);

    if (response.status == 'ok') {
      _sendState(CategoryDetailsState(
        state: ScreenState.Success,
        sources: response.sources,
      ));
    } else {
      _sendState(CategoryDetailsState(
        state: ScreenState.Error,
        errorMessage: response.message,));
    }
  }catch (e) {
    _sendState(CategoryDetailsState(
      state: ScreenState.Error,
      errorMessage: e.toString(),));
  }
}
void _sendState(CategoryDetailsState newState) {
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
class CategoryDetailsState{
  ScreenState state = ScreenState.Initial;

  List<Source>? sources;

  String? LoadingMessage;
  // incase of error
  String? errorMessage;


  CategoryDetailsState({this.state = ScreenState.Initial,
    this.sources,
    this.LoadingMessage,
    this.errorMessage,
  });
}


