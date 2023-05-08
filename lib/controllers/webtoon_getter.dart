import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nomad_toonflix/models/webtoon.dart';

class WebtoonGetter {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<Webtoon>> getTodayWebtoons() async {
    final Uri url = Uri.parse('$baseUrl/$today');
    final http.Response response = await http.get(url);

    List<Webtoon> ret = [];

    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body);
      for (var j in jsonMap) {
        ret.add(Webtoon.fromJson(j));
      }
      return ret;
    }
    throw Exception('Failed to load webtoons');
  }
}
