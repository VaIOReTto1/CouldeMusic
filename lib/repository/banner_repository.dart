import 'dart:convert';
import 'package:cloude_music/model/banner_model.dart';
import 'package:dio/dio.dart';

class BannerRepository {
  BannerModel model = BannerModel();

  // 异步方法，用于从服务器获取数据
  Future<void> getData() async {
    try {
      // 使用Dio发送HTTP GET请求
      Response res = await Dio().get("http://10.0.2.2:3000/banner");
      // 解析响应数据
      Map<String, dynamic> map = jsonDecode(res.toString());
      // 清空现有数据，以存储新数据
      model.imageUrl.clear();
      // 遍历并添加图片URL
      for (int i = 0; i < 5; i++) {
        model.imageUrl.add(map['banners'][i]['imageUrl']);
      }
    } catch (e) {
      // 打印错误信息
      print(e);
    }
  }
}
