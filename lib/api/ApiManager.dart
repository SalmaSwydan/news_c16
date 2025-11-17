import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_c16/api/model/resonse/articles/ArticlesResponse.dart';
import 'package:news_c16/api/model/resonse/sources/SourcesResponse.dart';

class ApiManager{
  // singleton
  static const String _baseUrl = "newsapi.org";
  static const String _sourcesApi = "v2/top-headlines/sources";
  static const String _articlesApi = "v2/everything";
  static const String _apiKey = "5909ae28122a471d8b0c237d5989cb73";

  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance(){
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<SourcesResponse> getNewsSources(String category)async{
    // call api to get new sources
    var params = {
      "category":category,
      "apiKey": _apiKey
    };
    var headers = {
      "Authorization" : _apiKey
    };
    var uri = Uri.https(_baseUrl,_sourcesApi,params);
    var response = await http.get(uri,headers: headers);
    print("sources Api ${response.statusCode}");
    print("sources Api ${response.body}");
    // parsing serialization
    var json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }


  Future<ArticlesResponse> getArticles(String sourceId)async{
    // call api to get new sources
    var params = {
      "sources":sourceId,
      "apiKey": _apiKey
    };
    var headers = {
      "Authorization" : _apiKey
    };
    var uri = Uri.https(_baseUrl,_articlesApi,params);
    var response = await http.get(uri,headers: headers);
    print("sources Api ${response.statusCode}");
    print("sources Api ${response.body}");
    // parsing serialization
    var json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);

    return articlesResponse;
  }
}