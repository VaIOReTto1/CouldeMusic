import 'package:cloude_music/config/config.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.menu,size: UIConfig.appBarIconSize,),
        Container(
          width: 300,
          height: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(65.0),),
            color: Color(UIConfig.searchColor),
          ),
          child: TextField(
            cursorColor: const Color(UIConfig.searchColor),
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 0, vertical: 2.0),
              hintText: "你是我为数不多的骄傲",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search,size: UIConfig.searchIconSize,),
            ),
          ),
        ),
      ],
    );
  }
}
