import 'package:cloude_music/config/config.dart';
import 'package:cloude_music/config/song_list_image.dart';
import 'package:cloude_music/repository/recommend_list_repository.dart';
import 'package:flutter/material.dart';

class SingList extends StatefulWidget {
  const SingList({super.key});

  @override
  State<SingList> createState() => _SingListState();
}

class _SingListState extends State<SingList> {
  // 实例化RecommendListRepository用于获取推荐歌单数据
  RecommendListRepository recommendListRepository = RecommendListRepository();

  @override
  void initState() {
    super.initState();
    // 在初始化时获取歌单数据
    recommendListRepository.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 标题行
        Row(
          children: [
            // 标题文本
            Padding(
              padding: EdgeInsets.fromLTRB(18, UIConfig.listTBpadding, 2, 0),
              child: Text(
                "推荐歌单",
                style: TextStyle(
                  fontSize: UIConfig.listFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // 右箭头图标
            Padding(
              padding: EdgeInsets.fromLTRB(0, UIConfig.listTBpadding, 2, 0),
              child: Icon(
                Icons.chevron_right_outlined,
                size: UIConfig.listFontSize * 1.5,
              ),
            )
          ],
        ),
        // 使用FutureBuilder异步加载数据
        FutureBuilder(
          future: recommendListRepository.getData(),
          builder: (context, snapshot) {
            // 根据加载状态展示不同内容
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 数据加载时显示进度指示器
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // 加载出错时显示错误信息
              return Text('Error: ${snapshot.error}');
            } else {
              // 数据加载完成时展示歌单列表
              return SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // 动态创建歌单列表项
                  children: List.generate(
                      recommendListRepository.model.listName.length, (index) {
                    return SongListImage(
                      listName: recommendListRepository.model.listName[index],
                      picUrl: recommendListRepository.model.picUrl[index],
                      playCount: recommendListRepository.model.playCount[index],
                    );
                  }),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
