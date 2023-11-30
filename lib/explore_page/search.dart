import 'package:cloude_music/config/config.dart';
import 'package:cloude_music/config/icon.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            Icons.menu,
            size: UIConfig.appBarIconSize * 1.2,
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            width: 300,
            height: UIConfig.appBarIconSize * 1.5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(65.0),
              ),
              color: Color(UIConfig.searchColor),
            ),
            child: TextField(
              cursorColor: const Color(UIConfig.searchColor),
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  hintText: "你是我为数不多的骄傲",
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    size: UIConfig.searchIconSize * 1.2,
                  ),
                  suffixIcon: Icon(
                    MyIcons.QRCode,
                    size: UIConfig.searchIconSize,
                  )),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Icon(
            MyIcons.free,
            size: UIConfig.appBarIconSize,
          ),
        ],
      ),
    );
  }
}
