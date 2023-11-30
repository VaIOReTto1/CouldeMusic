import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/recommend_song_model.dart';

class RecommendSongRepository {
  RecommendSongModel model = RecommendSongModel();

  Future<void> getData() async {
    try {
      Response res =
          await Dio().get("http://10.0.2.2:3000/personalized/newsong?limit=9");
      Map<String, dynamic> map = jsonDecode(res.toString());
      model.songName.clear();
      model.picUrl.clear();
      model.singerName.clear();
      for (var item in map["result"]) {
        model.songName.add(item['name']);
        model.picUrl.add(item['picUrl']);
        String singerName = "";
        for (var singer in item['song']['artists']) {
          singerName += "/${singer['name']}";
        }
        model.singerName.add(singerName.substring(1));
      }
    } catch (e) {
      print(e);
    }
  }
}
