import 'package:cloude_music/config/config.dart';
import 'package:cloude_music/config/icon.dart';
import 'package:flutter/material.dart';

class RecommendBar extends StatelessWidget {
  const RecommendBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(MyIcons.daily_recommend,size: UIConfig.recommendIconSize*1.1,),
        Icon(MyIcons.radio,size: UIConfig.recommendIconSize*1.1,),
        Icon(MyIcons.list,size: UIConfig.recommendIconSize*1.3,),
        Icon(MyIcons.ranking,size: UIConfig.recommendIconSize,)
      ],
    );
  }
}
