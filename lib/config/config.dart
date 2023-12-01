import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIConfig {
  // 屏幕大小
  static const double designWidth = 1080;
  static const double designHeight = 2400;

  //图标大小
  static final double appBarIconSize = ScreenUtil().setSp(64); //底部栏右侧图标大小
  static final double searchIconSize = ScreenUtil().setSp(44); //搜索框图标大小
  static final double recommendIconSize = ScreenUtil().setSp(78); //推荐栏图标大小
  static final double listImageSize = ScreenUtil().setSp(350); //歌单图片大小
  static final double bottomIconSize = ScreenUtil().setSp(76); //底部导航栏图标大小
  static final double recordImageSize = ScreenUtil().setSp(120); //播放歌曲专辑大小
  static final double recommendSingImageSize = ScreenUtil().setSp(160); //推荐歌曲图片大小
  static final double listIconSize = ScreenUtil().setSp(80); //歌单图标大小

  //字体大小
  static final double searchFontSize = ScreenUtil().setSp(40); //搜索框字体大小
  static final double recommendFontSize = ScreenUtil().setSp(35); //推荐栏字体大小
  static final double listFontSize = ScreenUtil().setSp(45); //推荐歌单字体大小

  //色彩
  static const List<Color> backgroundColor = [
    Color(0xffe1d7f5),Color(0xffece5fc),Color(0xfff7e5f1),Color(0xffffffff)
  ]; //
  static const List<Color> searchColor = [
    Color(0xffd8dbfa),Color(0xffe8d8fc),Color(0xfff1d9f3)
  ];
  static const Color iconColor = Color(0xfffc5a5b); //图标颜色

  //圆角及边距
  static final double radius = ScreenUtil().setSp(25); //圆角
  static final double listLRPadding = ScreenUtil().setSp(16); //歌单左右间距
  static final double listTBpadding = ScreenUtil().setSp(16); //歌单上下间距
}
