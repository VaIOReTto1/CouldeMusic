import 'package:cloude_music/explore_page/sing_list.dart';
import 'package:cloude_music/repository/recommend_song_repository.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';
import '../config/song_list.dart';
import '../config/song_list_image.dart';

class RecommendSong extends StatefulWidget {
  const RecommendSong({super.key});

  @override
  State<RecommendSong> createState() => _RecommendSongState();
}

class _RecommendSongState extends State<RecommendSong> {
  RecommendSongRepository recommendSongRepository = RecommendSongRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recommendSongRepository.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(18, UIConfig.listTBpadding, 2, 0),
              child: Text(
                "好听的宝藏歌曲推荐",
                style: TextStyle(
                  fontSize: UIConfig.listFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, UIConfig.listTBpadding, 2, 0),
              child: Icon(
                Icons.chevron_right_outlined,
                size: UIConfig.listFontSize * 1.5,
              ),
            )
          ],
        ),
        FutureBuilder(
          future: recommendSongRepository.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // 总数据长度
              int totalItems = recommendSongRepository.model.singerName.length;
              // 每页显示的元素数量
              int itemsPerPage = 3;
              // 总页数
              int totalPages = (totalItems / itemsPerPage).ceil();
              return SizedBox(
                height: UIConfig.recommendSingImageSize*4.1,
                child: PageView.builder(
                  itemCount: totalPages,
                  itemBuilder: (context, pageIndex) {
                    // 计算当前页的开始和结束索引
                    int startIndex = pageIndex * itemsPerPage;
                    return ListView.builder(
                      padding: const EdgeInsets.all(4),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        int actualIndex = startIndex + index;
                        return SongList(
                          singerName: recommendSongRepository
                              .model.singerName[actualIndex],
                          picUrl:
                              recommendSongRepository.model.picUrl[actualIndex],
                          songName: recommendSongRepository
                              .model.songName[actualIndex],
                        );
                      },
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
