import 'package:flutter/material.dart';
import 'package:newsapp/widgets/article_detail.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl, heading, summary, content;

  const NewsTile(
      {Key? key,
      required this.imgUrl,
      required this.heading,
      required this.summary,
      required this.content})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleDetail(
                      imgUrl: imgUrl,
                      heading: heading,
                      summary: content,
                    )));
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    heading,
                    maxLines: 2,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    summary,
                    maxLines: 2,
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
