import 'dart:convert';
import '../model/recommend_list_model.dart';

import 'package:dio/dio.dart';

class RecommendListRepository {
  RecommendListModel model = RecommendListModel();

  // 异步方法，用于从服务器获取数据
  Future<void> getData() async {
    try {
      // 使用Dio发送HTTP GET请求
      Response res = await Dio().get("http://10.0.2.2:3000/personalized?limit=6");
      // 解析响应数据
      Map<String, dynamic> map = jsonDecode(res.toString());
      // 清空现有数据，以存储新数据
      model.listName.clear();
      model.picUrl.clear();
      model.playCount.clear();
      // 遍历并添加歌单信息
      for (var item in map["result"]) {
        String playCount = item['playCount'].toString();
        model.listName.add(item['name']);
        model.playCount.add('${playCount.substring(0, playCount.length - 4)}w');
        model.picUrl.add(item['picUrl']);
      }
    } catch (e) {
      // 打印错误信息
      print(e);
    }
  }
}
