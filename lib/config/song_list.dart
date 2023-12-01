import 'package:cloude_music/config/icon.dart';
import 'package:flutter/material.dart';
import 'config.dart';

class SongList extends StatelessWidget {
  // 定义成员变量：歌手名、歌曲名、图片URL
  final String singerName;
  final String songName;
  final String picUrl;

  SongList(
      {super.key,
        required this.singerName,
        required this.picUrl,
        required this.songName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: UIConfig.listTBpadding, horizontal: UIConfig.listLRPadding*2.5),
      child: Row(
        // 使用Row布局
        children: [
          // 歌曲封面图片
          ClipRRect(
            borderRadius: BorderRadius.circular(UIConfig.radius), // 圆角效果
            child: Image.network(
              picUrl,
              fit: BoxFit.cover,
              width: UIConfig.recommendSingImageSize,
              height: UIConfig.recommendSingImageSize,
            ),
          ),
          Expanded(
            // 歌曲名称和歌手名
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 左对齐
                mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
                children: [
                  Text(songName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(singerName, style: const TextStyle(color: Color(0xffa8a8a8))),
                ],
              ),
            ),
          ),
          // 视频图标
          Icon(
            MyIcons.vedio,
            size: UIConfig.recommendIconSize*0.8,
            color: const Color(0xffaaaaa1),
          )
        ],
      ),
    );
  }
}
