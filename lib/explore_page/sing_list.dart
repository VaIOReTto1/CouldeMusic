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
  RecommendListRepository recommendListRepository = RecommendListRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   recommendListRepository.getData();
    print(recommendListRepository.model.playCount.length);
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
                "推荐歌单",
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
          future: recommendListRepository.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                child: Row(
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
