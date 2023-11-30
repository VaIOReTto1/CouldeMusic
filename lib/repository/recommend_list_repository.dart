import 'dart:convert';

import '../model/recommend_list_model.dart';

import 'package:dio/dio.dart';
class RecommendListRepository {
  RecommendListModel model = RecommendListModel();

  Future<void> getData() async {
    try {
      Response res = await Dio().get("http://10.0.2.2:3000/personalized?limit=6");
      Map<String, dynamic> map = jsonDecode(res.toString());
      model.listName.clear();
      model.picUrl.clear();
      model.playCount.clear();
      for (var item in map["result"]) {
        String playCount = item['playCount'].toString();
        model.listName.add(item['name']);
        model.playCount.add('${playCount.substring(0, playCount.length - 4)}w');
        model.picUrl.add(item['picUrl']);
      }
    } catch (e) {
      print(e);
    }
  }
}
