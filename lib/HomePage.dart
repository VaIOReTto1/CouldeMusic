import 'package:cloude_music/config/config.dart';
import 'package:cloude_music/config/song_list.dart';
import 'package:cloude_music/explore_page/recommend_bar.dart';
import 'package:cloude_music/explore_page/recommend_song.dart';
import 'package:cloude_music/model/banner_model.dart';
import 'package:cloude_music/repository/banner_repository.dart';
import 'package:flutter/material.dart';

import 'explore_page/search.dart';
import 'explore_page/banner.dart';
import 'explore_page/sing_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).padding.top, 0, 0),
                decoration: const BoxDecoration(
                  boxShadow: UIConfig.backgroundColor,
                ),
                child: const Search()),
            const RecommendBanner(),
            const RecommendBar(),
            const SingList(),
            const RecommendSong(),
          ],
        ),
      ),
    );
  }
}
