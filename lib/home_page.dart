import 'package:cloude_music/empty_page.dart';
import 'package:cloude_music/explore_page/explore_page.dart';
import 'package:flutter/material.dart';

import 'config/config.dart';
import 'config/icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: IndexedStack(
        index: _currentPageIndex,
        children: _pages,
      ),
      bottomNavigationBar: SizedBox(
        height: 108,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        UIConfig.listLRPadding, 0, UIConfig.listLRPadding, 0),
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(45)),
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
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(UIConfig.listLRPadding, 0, 0, 0),
                    child: const Text("苦瓜",style: TextStyle(color: Color(0xff464556)),),
                  ),
                  const Expanded(
                      child: Text(
                    "  -  陈奕迅",
                    style: TextStyle(color: Color(0xff909090)),
                  )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        UIConfig.listLRPadding, 0, UIConfig.listLRPadding, 0),
                    child: Icon(MyIcons.song_run,size: UIConfig.recommendIconSize*0.95,color: const Color(0xffa8a8a8),),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        UIConfig.listLRPadding, 0, UIConfig.listLRPadding, 0),
                    child: Icon(MyIcons.run_list,size: UIConfig.recommendIconSize*0.78,color: const Color(0xff464556)),
                  ),
                ],
              ),
            ),
            BottomNavigationBar(
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
                BottomNavigationBarItem(
                  icon: Icon(
                    MyIcons.cloud_music,
                    size: 20,
                  ),
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
      ),
    );
  }
}
