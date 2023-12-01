import 'package:cloude_music/repository/recommend_song_repository.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';
import '../config/song_list.dart';

class RecommendSong extends StatefulWidget {
  const RecommendSong({super.key});

  @override
  State<RecommendSong> createState() => _RecommendSongState();
}

class _RecommendSongState extends State<RecommendSong> {
  // 实例化RecommendSongRepository用于获取推荐歌曲数据
  RecommendSongRepository recommendSongRepository = RecommendSongRepository();

  @override
  void initState() {
    super.initState();
    // 在初始化时获取数据
    recommendSongRepository.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 子元素左对齐
      children: [
        Row(
          // 行布局包含标题和图标
          children: [
            Padding(
              // “好听的宝藏歌曲推荐”标题
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
              // 右箭头图标
              padding: EdgeInsets.fromLTRB(0, UIConfig.listTBpadding, 2, 0),
              child: Icon(
                Icons.chevron_right_outlined,
                size: UIConfig.listFontSize * 1.5,
              ),
            )
          ],
        ),
        FutureBuilder(
          // 使用FutureBuilder处理异步数据
          future: recommendSongRepository.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 加载时显示进度指示器
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // 出错时显示错误信息
              return Text('Error: ${snapshot.error}');
            } else {
              // 正常加载完成时展示歌曲列表
              return buildSongList();
            }
          },
        ),
      ],
    );
  }

  // 构建歌曲列表的辅助函数
  Widget buildSongList() {
    // 计算总数据长度、每页显示的元素数量和总页数
    int totalItems = recommendSongRepository.model.singerName.length;
    int itemsPerPage = 3;
    int totalPages = (totalItems / itemsPerPage).ceil();

    return SizedBox(
      height: UIConfig.recommendSingImageSize * 4.1,
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
              // 为每首歌曲创建SongList组件
              return SongList(
                singerName: recommendSongRepository
                    .model.singerName[actualIndex],
                picUrl: recommendSongRepository.model.picUrl[actualIndex],
                songName: recommendSongRepository.model.songName[actualIndex],
              );
            },
          );
        },
      ),
    );
  }
}
