import 'package:cloude_music/empty_page.dart';
import 'package:cloude_music/explore_page/explore_page.dart';
import 'package:cloude_music/run_song_list.dart';
import 'package:flutter/material.dart';

import 'config/config.dart';
import 'config/icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 当前选中的页面索引
  int _currentPageIndex = 0;

  // 页面列表
  final List<Widget> _pages = [
    const ExplorePage(), // 探索页面
    const EmptyPage(),   // 其他空页面，用作占位
    const EmptyPage(),
    const EmptyPage(),
    const EmptyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 防止键盘弹出时影响布局
      body: IndexedStack(
        // 使用IndexedStack维护页面状态
        index: _currentPageIndex,
        children: _pages,
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    // 构建底部导航栏
    return SizedBox(
      height: 108,
      child: Column(
        children: [
          const RunSongList(), // 歌曲播放列表组件
          BottomNavigationBar(
            // 底部导航栏
            currentIndex: _currentPageIndex,
            onTap: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            selectedItemColor: UIConfig.iconColor,
            unselectedItemColor: const Color.fromRGBO(111, 111, 111, .8),
            selectedLabelStyle: const TextStyle(
              fontSize: 8, // 选中时文字大小
              fontWeight: FontWeight.bold, // 选中时文字粗细
            ),
            items: const [
              // 导航项配置
              BottomNavigationBarItem(
                icon: Icon(MyIcons.cloud_music, size: 20),
                label: '发现',
              ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyIcons.community,
                    size: 20,
                  ),
                  label: '播客',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyIcons.music,
                    size: 20,
                  ),
                  label: '我的 ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyIcons.favorite,
                    size: 20,
                  ),
                  label: '关注 ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyIcons.message,
                    size: 20,
                  ),
                  label: '消息 ',
                ),
              ],
            ),
          ],
        ),
      );
  }
}
