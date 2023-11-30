import 'package:cloude_music/config/config.dart';
import 'package:flutter/material.dart';

class SongListImage extends StatelessWidget {
  SongListImage(
      {super.key,
      required this.listName,
      required this.picUrl,
      required this.playCount});

  String listName;
  String playCount;
  String picUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UIConfig.listImageSize,
      padding: EdgeInsets.symmetric(
          vertical: UIConfig.listTBpadding, horizontal: UIConfig.listLRPadding),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(UIConfig.radius),
                child: Image.network(
                  picUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                  top: 2,
                  right: 3,
                  child: Text(
                    playCount,
                    style: TextStyle(
                        fontSize: UIConfig.recommendFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  bottom: -17,
                  right: -17,
                  child: Icon(
                    Icons.arrow_right_rounded,
                    size: UIConfig.listIconSize,
                    color: Colors.white,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              listName,
              style: TextStyle(fontSize: UIConfig.recommendFontSize,color: const Color(0xff3b424a)),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
