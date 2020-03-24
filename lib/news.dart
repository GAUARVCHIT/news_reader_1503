import 'package:http/http.dart' as http;
import 'arcticle.dart';
import 'dart:convert';

class News {
  List<Arcticle> news = [];
  String apiKey = 'e24908a45b8a4c1d9dff0e3e1bbc6cef';
  String headlines = 'top-headlines';

  Future<void> getNews() async {
    String url =
        'http://newsapi.org/v2/${headlines}?country=us&apiKey=${apiKey}';
    var response = await http.get(url);
    print('response code ${response.body}');

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null) {
            Arcticle arcticle = Arcticle(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              publishedAt: DateTime.parse(element['publishedAt']),
              content: element['content'],
            );
            news.add(arcticle);
          }
        },
      );
    }
  }
}
