import 'package:cloude_music/config/config.dart';
import 'package:cloude_music/config/icon.dart';
import 'package:flutter/material.dart';

class RecommendBar extends StatelessWidget {
  const RecommendBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildColumn(MyIcons.daily_recommend, "每日推荐",size: 0.9),
        buildColumn(MyIcons.radio, "私人漫游"),
        buildColumn(MyIcons.list, "歌单"),
        buildColumn(MyIcons.ranking, "排行榜")
      ],
    );
  }

  Column buildColumn(IconData icon, String text, {double size = 1 }) {
    return Column(
      children: [
        Icon(
          icon,
          size: UIConfig.recommendIconSize * size,
          color: UIConfig.iconColor,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: UIConfig.recommendFontSize * 0.8,
                color: const Color(0xffa8a8a8)
            ),
          ),
        )
      ],
    );
  }
}
