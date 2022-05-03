//Model
class ArticleModel {
  String title;
  String description;
  String urlToImage;
  String content;
  ArticleModel(
      {required this.title,
      required this.description,
      required this.urlToImage,
      required this.content});
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return (ArticleModel(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      content: json['content'],
    ));
  }
}
