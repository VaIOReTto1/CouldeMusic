import 'package:cloude_music/config/config.dart';
import 'package:cloude_music/explore_page/recommend_bar.dart';
import 'package:cloude_music/explore_page/recommend_song.dart';
import 'package:flutter/material.dart';

import 'search.dart';
import 'banner.dart';
import 'sing_list.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // 创建滚动控制器
  final ScrollController _scrollController = ScrollController();
  // 用于控制背景渐变的状态变量
  bool _isScroll = false;

  @override
  void initState() {
    super.initState();
    // 监听滚动事件
    _scrollController.addListener(() {
      // 根据滚动位置更改背景渐变状态
      if (_scrollController.offset == 0 && _isScroll == true) {
        setState(() {
          _isScroll = false;
        });
      } else if (_scrollController.offset > 0 && _isScroll == false) {
        setState(() {
          _isScroll = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            // 设置padding以避开状态栏
              padding: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).padding.top, 0, 0),
              // 根据滚动状态设置背景渐变
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      colors: _isScroll
                          ? [Colors.white]
                          : UIConfig.backgroundColor,
                      radius: .8,
                      center: Alignment.topCenter)),
              child: Column(
                children: [
                  const Search(), // 搜索栏
                  SingleChildScrollView(
                    // 滚动视图
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: const [
                          RecommendBanner(), // 横幅广告
                          RecommendBar(), // 推荐栏
                          SingList(), // 推荐歌单
                          RecommendSong(), // 推荐歌曲
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
