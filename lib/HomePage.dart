import 'package:cloude_music/config/config.dart';
import 'package:flutter/material.dart';

import 'explore_page/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).padding.top, 0, 0),
              decoration: const BoxDecoration(
                boxShadow: UIConfig.backgroundColor,
              ),
              child: const Search()),
        ],
      ),
    );
  }
}
