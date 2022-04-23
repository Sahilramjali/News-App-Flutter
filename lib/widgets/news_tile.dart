import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl, heading, summary;

  const NewsTile(
      {Key? key,
      required this.imgUrl,
      required this.heading,
      required this.summary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 5, left: 3, right: 3),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
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
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                heading,
                maxLines: 2,
                style: const TextStyle(
                    color: Colors.black,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
