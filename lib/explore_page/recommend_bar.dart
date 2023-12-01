import 'package:cloude_music/config/config.dart';
import 'package:cloude_music/config/icon.dart';
import 'package:flutter/material.dart';

class RecommendBar extends StatelessWidget {
  const RecommendBar({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用Row布局，包含四个图标和文本
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // 水平等间距排列
      children: [
        // 分别创建每个推荐项目
        buildColumn(MyIcons.daily_recommend, "每日推荐", size: 0.9),
        buildColumn(MyIcons.radio, "私人漫游"),
        buildColumn(MyIcons.list, "歌单"),
        buildColumn(MyIcons.ranking, "排行榜")
      ],
    );
  }

  // 用于构建图标和文本的辅助方法
  Column buildColumn(IconData icon, String text, {double size = 1}) {
    return Column(
      children: [
        Icon(
          icon, // 图标
          size: UIConfig.recommendIconSize * size, // 根据UI配置设置图标大小
          color: UIConfig.iconColor, // 使用配置中的图标颜色
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 0), // 文本的上边距
          child: Text(
            text, // 显示文本
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: UIConfig.recommendFontSize * 0.8, // 文本大小
                color: const Color(0xffa8a8a8) // 文本颜色
            ),
          ),
        )
      ],
    );
  }
}
