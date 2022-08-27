import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/news_model_data.dart';

class NewsArt {
  List<Newzmodel> newsart = [];

  Future<void> geturl() async {
    var url = Uri(
        scheme: 'https',
        host: 'gnews.io',
        path: '/api/v4/top-headlines',
        queryParameters: {
          'country': 'in',
          'token': 'e83c5c7ff7677a072c1daa8eb0620d8d',
        });
    var respone = await http.get(url);

    var data = jsonDecode(respone.body);
    print(data);
    if (data['totalArticles'].toString().length > 0) {
      print("bahu data aa gya");
      data["articles"].forEach((element) {
        if (element["image"] != null && element["publishedAt"] != null) {
          Newzmodel articlmodel = Newzmodel(
            title: element['title'],
            date: element['publishedAt'],
            newsurl: element["url"],
            urlImage: element['image'],
          );
          newsart.add(articlmodel);
        }
      });
    }
  }
}

class SearchNews {
  List<Newzmodel> newsart = [];

  Future<void> geturl(String squery) async {
    var url = Uri(
        scheme: 'https',
        host: 'gnews.io',
        path: '/api/v4/search',
        queryParameters: {
          'q': squery,
          'token': 'e83c5c7ff7677a072c1daa8eb0620d8d',
        });

    var respone = await http.get(url);

    var data = jsonDecode(respone.body);
    if (data['totalArticles'].toString().isNotEmpty) {
      data["articles"].forEach((element) {
        if (element["image"] != null && element["publishedAt"] != null) {
          Newzmodel articlmodel = Newzmodel(
            title: element['title'],
            date: element['publishedAt'],
            newsurl: element["url"],
            urlImage: element['image'],
          );
          newsart.add(articlmodel);
        }
      });
    }
  }
}
