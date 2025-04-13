import 'package:flutter/material.dart';
import 'package:simportal/view/detail_view.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsUrl;
  String newsCnt;

  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsHead,
      required this.newsDesc,
      required this.newsUrl,
      required this.newsCnt});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FadeInImage.assetNetwork(
            height: 200,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
            placeholder: "assets/img/imggggg.jpg",
            image: imgUrl),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                newsHead.length > 70
                    ? "${newsHead.substring(0, 70)}........"
                    : newsHead,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                newsCnt != "--"
                    ? newsCnt.length > 200
                        ? newsCnt.substring(0, 100)
                        : "${newsCnt.toString().substring(0, newsCnt.length - 15)}........."
                    : newsCnt,
                style: const TextStyle(fontSize: 14, color: Colors.black38),
              ),
              Text(
                newsDesc,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailViewScreen(newsUrl: newsUrl)));
                  },
                  child: const Text("Read More")),
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
      ]),
    );
  }
}
