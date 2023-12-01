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
  final ScrollController _scrollController = ScrollController();
  bool _isScroll = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      print(_scrollController.offset);
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
              padding: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).padding.top, 0, 0),
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      colors: _isScroll
                          ? [Colors.white]
                          : UIConfig.backgroundColor,
                      radius: .8,
                      center: Alignment.topCenter)),
              child: Column(
                children: [
                  const Search(),
                  SingleChildScrollView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: const [
                          RecommendBanner(),
                          RecommendBar(),
                          SingList(),
                          RecommendSong(),
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
