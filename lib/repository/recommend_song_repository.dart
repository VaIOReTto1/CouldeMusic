import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/recommend_song_model.dart';

class RecommendSongRepository {
  RecommendSongModel model = RecommendSongModel();

  // 异步方法，用于从服务器获取数据
  Future<void> getData() async {
    try {
      // 使用Dio发送HTTP GET请求
      Response res =
      await Dio().get("http://10.0.2.2:3000/personalized/newsong?limit=9");
      // 解析响应数据
      Map<String, dynamic> map = jsonDecode(res.toString());
      // 清空现有数据，以存储新数据
      model.songName.clear();
      model.picUrl.clear();
      model.singerName.clear();
      // 遍历并添加歌曲信息
      for (var item in map["result"]) {
        model.songName.add(item['name']);
        model.picUrl.add(item['picUrl']);
        // 构建歌手名字符串
        String singerName = "";
        for (var singer in item['song']['artists']) {
          singerName += "/${singer['name']}";
        }
        model.singerName.add(singerName.substring(1));
      }
    } catch (e) {
      // 打印错误信息
      print(e);
    }
  }
}
