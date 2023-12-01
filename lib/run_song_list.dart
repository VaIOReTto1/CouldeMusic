import 'package:flutter/material.dart';
import 'config/config.dart';
import 'config/icon.dart';

class RunSongList extends StatelessWidget {
  const RunSongList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity, // 设置宽度为铺满父容器
      child: Row(
        // 使用行布局
        children: [
          // 歌曲封面图容器
          buildSongCover(),
          // 歌曲名称
          buildSongName(),
          // 歌手名称
          buildSingerName(),
          // 控制图标
          buildControlIcons(),
        ],
      ),
    );
  }

  Widget buildSongCover() {
    // 构建歌曲封面图
    return Container(
      margin: EdgeInsets.fromLTRB(
          UIConfig.listLRPadding, 0, UIConfig.listLRPadding, 0),
      width: 45.0,
      height: 45.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            "https://p1.music.126.net/GGYQjJ-zDEivv9l6QgJUFg==/109951163020567917.jpg",
            width: 30,
            height: 30,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget buildSongName() {
    // 构建歌曲名称
    return Padding(
      padding: EdgeInsets.fromLTRB(UIConfig.listLRPadding, 0, 0, 0),
      child: const Text(
        "苦瓜",
        style: TextStyle(color: Color(0xff464556)),
      ),
    );
  }

  Widget buildSingerName() {
    // 构建歌手名称
    return const Expanded(
      child: Text(
        "  -  陈奕迅",
        style: TextStyle(color: Color(0xff909090)),
      ),
    );
  }

  Widget buildControlIcons() {
    // 构建控制图标
    return Padding(
      padding: EdgeInsets.fromLTRB(
          UIConfig.listLRPadding, 0, UIConfig.listLRPadding, 0),
      child: Icon(
        MyIcons.song_run,
        size: UIConfig.recommendIconSize * 0.95,
        color: const Color(0xffa8a8a8),
      ),
    );
  }
}
