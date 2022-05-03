import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/services/api_service.dart';
import 'package:newsapp/widgets/news_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _loading = true;
  List<ArticleModel> newlist = [];

  @override
  void initState() {
    super.initState();
    getNews().then((value) {
      setState(() {
        _loading = false;
        newlist = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    newlist.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News"),
          centerTitle: true,
        ),
        body: _loading
            ? Center(
                child: Lottie.asset("assets/loading.json"),
              )
            : Container(
                color: Colors.white,
                child: ListView.builder(
                    itemCount: newlist.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      //newsTile is custom widget which accepts imgurl,heading and summary and render on screen
                      return NewsTile(
                        imgUrl: newlist[index].urlToImage,
                        heading: newlist[index].title,
                        summary: newlist[index].description,
                        content: newlist[index].content,
                      );
                    }),
              ));
  }
}
