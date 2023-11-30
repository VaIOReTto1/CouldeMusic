import 'package:cloude_music/config/config.dart';
import 'package:flutter/material.dart';

class SingList extends StatefulWidget {
  const SingList({super.key});

  @override
  State<SingList> createState() => _SingListState();
}

class _SingListState extends State<SingList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text("推荐歌单",style: TextStyle(
                fontSize: UIConfig.listFontSize,
                fontWeight: FontWeight.bold
              ),),
              Icon(Icons.chevron_right_outlined,size: UIConfig.listFontSize*1.5,)
            ],
          ),
        ],
      ),
    );
  }
}
