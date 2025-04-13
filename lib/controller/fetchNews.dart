//https://newsapi.org/v2/everything?q=tesla&from=2024-05-12&sortBy=publishedAt&apiKey=a99fe69f6e304065905dd42f129ebc72
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:simportal/model/newsArt.dart';

class FetchNews {
  static List sourceId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

  static Future<NewsArt> fetchNews() async {
    final random = Random();
    var element = sourceId[random.nextInt(sourceId.length)];
    print(element);

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$element&apiKey=a99fe69f6e304065905dd42f129ebc72"));

    Map bodyData = jsonDecode(response.body);
    List articles = bodyData["articles"];

    // print(articles);

    final Myrandom = Random();
    var myarticles = articles[random.nextInt(articles.length)];
    print(myarticles);

    return NewsArt.formAPItoapp(myarticles);
  }
}
