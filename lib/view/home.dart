import 'package:flutter/material.dart';
import 'package:simportal/controller/fetchNews.dart';
import 'package:simportal/model/newsArt.dart';
import 'package:simportal/view/widget/NewsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool Isloading = true;
  late NewsArt newsArt;

  GetNews() async {
    newsArt = await FetchNews.fetchNews();
    print(newsArt.newsCnt);
    setState(() {
      Isloading = false;
    });
  }

  @override
  void initState() {
    GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            setState(() {
              Isloading = true;
            });
            GetNews();
          },
          itemBuilder: (context, index) {
            return Isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : NewsContainer(
                    imgUrl: newsArt.imgUrl,
                    newsHead: newsArt.newsHead,
                    newsCnt: newsArt.newsCnt,
                    newsDesc: newsArt.newsDes,
                    newsUrl: newsArt.newsUrl);
          }),
    );
  }
}
