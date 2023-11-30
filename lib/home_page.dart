import 'package:cloude_music/empty_page.dart';
import 'package:cloude_music/explore_page/explore_page.dart';
import 'package:flutter/material.dart';

import 'config/icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color unselect_color = const Color.fromRGBO(111, 111, 111, 1);
  Color? select_color = Colors.red[500];
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const ExplorePage(),
    const EmptyPage(),
    const EmptyPage(),
    const EmptyPage(),
    const EmptyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack( //使用IndexedStack作为body
        index: _currentPageIndex, //当前显示的子组件索引
        children: _pages, //子组件列表
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          selectedItemColor: select_color,
          unselectedItemColor: unselect_color,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                MyIcons.cloud_music,
                size: 28,
              ),
              label: '发现',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MyIcons.community,
                size: 28,
              ),
              label: '播客',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MyIcons.music,
                size: 28,
              ),
              label: '我的 ',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 28,
              ),
              label: '关注 ',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MyIcons.message,
                size: 28,
              ),
              label: '消息 ',
            ),
          ],
        ),
      ),
    );
  }
}
