import 'dart:convert';
import 'package:newsapp/model/article_model.dart';
import 'package:http/http.dart' as http;

Uri uri = Uri.parse(
    "https://newsapi.org/v2/everything?q=bitcoin&apiKey=d394960d6d364a9eacb07e25ed5d5e76");
Future<List<ArticleModel>> getNews() async {
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);
    List list = map['articles'];
    List<ArticleModel> newsList =
        list.map((data) => ArticleModel.fromJson(data)).toList();
    return newsList;
  } else {
    // print("error");
    return [];
  }
}
