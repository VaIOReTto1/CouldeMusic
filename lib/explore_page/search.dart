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
    // Responsive width for the search container
    double width = MediaQuery.of(context).size.width * 0.7;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // Align items to the start of the row
        children: [
          Icon(
            Icons.menu,
            size: UIConfig.appBarIconSize * 1.2,
          ),
          const SizedBox(width: 15),
          Expanded(
            // Use Expanded instead of a fixed width container
            child: Container(
              height: UIConfig.appBarIconSize * 1.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  // More rounded corners
                  gradient: const LinearGradient(
                      colors: UIConfig.searchColor,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: TextField(
                // Use a different color for cursor
                style: const TextStyle(color: Colors.black, fontSize: 16),
                // Increase font size
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  hintText: "你是我为数不多的骄傲",
                  hintStyle: const TextStyle(color: Colors.grey),
                  // Lighter text for placeholder
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    size: UIConfig.searchIconSize * 1.2,
                    color: Colors.grey, // Icon color that's not too striking
                  ),
                  suffixIcon: Icon(
                    MyIcons.QRCode,
                    size: UIConfig.searchIconSize,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Icon(
            MyIcons.free,
            size: UIConfig.appBarIconSize,
            color: Colors.grey, // Consistent icon color
          ),
        ],
      ),
    );
  }
}
