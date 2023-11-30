import 'dart:async';
import 'package:cloude_music/model/banner_model.dart';
import 'package:cloude_music/repository/banner_repository.dart';
import 'package:flutter/material.dart';

import '../repository/banner_repository.dart';

class RecommendBanner extends StatefulWidget {
  const RecommendBanner({super.key});

  @override
  State<RecommendBanner> createState() => _RecommendBannerState();
}

class _RecommendBannerState extends State<RecommendBanner> {
  BannerRepository bannerRepository = BannerRepository();

  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    bannerRepository.getData();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < bannerRepository.model.imageUrl.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      padding: const EdgeInsets.all(12),
      child: FutureBuilder(
          future: bannerRepository.getData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: bannerRepository.model.imageUrl.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network(
                        bannerRepository.model.imageUrl[index],
                        fit: BoxFit.fitWidth,
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      bannerRepository.model.imageUrl.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
