import 'dart:convert';
import 'package:cloude_music/model/banner_model.dart';
import 'package:dio/dio.dart';

class BannerRepository {
  BannerModel model = BannerModel();

  Future<void> getData() async {
    try {
      Response res = await Dio().get("http://10.0.2.2:3000/banner");
      Map<String, dynamic> map = jsonDecode(res.toString());
      model.imageUrl.clear();
      for (int i = 0; i < 5; i++) {
        model.imageUrl.add(map['banners'][i]['imageUrl']);
      }
    } catch (e) {
      print(e);
    }
  }
}
