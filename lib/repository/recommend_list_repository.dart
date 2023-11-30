import 'dart:convert';

import '../model/recommend_list_model.dart';

import 'package:dio/dio.dart';
class RecommendListRepository{
  RecommendListModel model=RecommendListModel();

  Future<void> getData() async {
    try {
      Response res = await Dio().get("http://10.0.2.2:3000/personalized?limit=6");
      Map<String, dynamic> map = jsonDecode(res.toString());
      model.listName.clear();
      model.picUrl.clear();
      model.playCount.clear();
      for (int i = 0; i < 6; i++) {
        model.listName.add(map["result"][i]['name']);
        model.playCount.add(map["result"][i]['playCount'].substring(0, map["result"][i]['playCount'].length - 4) + 'w');
        model.picUrl.add(map["result"][i]['picUrl']);
      }
    } catch (e) {
      print(e);
    }
  }
}