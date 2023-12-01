import 'package:cloude_music/config/config.dart';
import 'package:cloude_music/config/icon.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {

    // 使用Padding包裹Row，为整个搜索栏提供外边距
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // 行内元素靠左排列
        children: [
          Icon(
            Icons.menu, // 菜单图标
            size: UIConfig.appBarIconSize * 1.2, // 设置图标大小
          ),
          const SizedBox(width: 15), // 间隔
          Expanded(
            // 使用Expanded使搜索框占据剩余空间
            child: Container(
              height: UIConfig.appBarIconSize * 1.5, // 容器高度
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0), // 圆角
                gradient: const LinearGradient(
                  // 线性渐变背景色
                  colors: UIConfig.searchColor,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  hintText: "你是我为数不多的骄傲", // 占位符文本
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none, // 无边框
                  prefixIcon: Icon(
                    Icons.search, // 搜索图标
                    size: UIConfig.searchIconSize * 1.2,
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(
                    MyIcons.QRCode, // 二维码图标
                    size: UIConfig.searchIconSize,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15), // 间隔
          Icon(
            MyIcons.free, // 自定义图标
            size: UIConfig.appBarIconSize,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
