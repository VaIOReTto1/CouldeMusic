import 'package:flutter/material.dart';

import 'config.dart';

class SongList extends StatelessWidget {
  String singerName;
  String songName;
  String picUrl;

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
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(UIConfig.radius),
              child: Image.network(
                picUrl,
                fit: BoxFit.cover,
                width: UIConfig.recommendSingImageSize,
                height: UIConfig.recommendSingImageSize,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 对齐文本到左边
                mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
                children: [
                  Text(songName,style: const TextStyle(fontWeight: FontWeight.bold),),
                  Text(singerName,style: const TextStyle(color: Color(0xffa8a8a8)),),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
