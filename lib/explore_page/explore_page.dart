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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).padding.top, 0, 0),
              decoration: const BoxDecoration(
                boxShadow: UIConfig.backgroundColor,
              ),
              child: const Search()),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.8,
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
      ),
    );
  }
}