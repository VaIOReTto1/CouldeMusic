import 'package:cloude_music/config/config.dart';
import 'package:cloude_music/config/icon.dart';
import 'package:flutter/material.dart';

class SongListImage extends StatelessWidget {
  const SongListImage(
      {super.key,
        required this.listName,
        required this.picUrl,
        required this.playCount});

  // 定义成员变量
  final String listName;
  final String playCount;
  final String picUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UIConfig.listImageSize, // 设置容器宽度
      padding: EdgeInsets.symmetric(
          vertical: UIConfig.listTBpadding, horizontal: UIConfig.listLRPadding), // 设置内边距
      child: Column(
        children: [
          Stack(
            children: [
              // 歌单封面图
              ClipRRect(
                borderRadius: BorderRadius.circular(UIConfig.radius), // 圆角
                child: Image.network(
                  picUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
              // 播放次数显示
              Positioned(
                top: 2,
                right: 3,
                child: Text(
                  playCount,
                  style: TextStyle(
                      fontSize: UIConfig.recommendFontSize,
                      color: const Color(0xffdddddd),
                      fontWeight: FontWeight.bold),
                ),
              ),
              // 播放图标
              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  MyIcons.run,
                  size: UIConfig.listIconSize,
                  color: Colors.white,
                ),
              )
            ],
          ),
          // 歌单名称
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              listName,
              style: TextStyle(fontSize: UIConfig.recommendFontSize, color: const Color(0xff3b424a)),
              maxLines: 2, // 最大行数为2
            ),
          )
        ],
      ),
    );
  }
}
