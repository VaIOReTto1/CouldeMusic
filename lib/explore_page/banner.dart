import 'dart:async';
import 'package:cloude_music/config/config.dart';
import 'package:cloude_music/repository/banner_repository.dart';
import 'package:flutter/material.dart';

class RecommendBanner extends StatefulWidget {
  const RecommendBanner({super.key});

  @override
  State<RecommendBanner> createState() => _RecommendBannerState();
}

class _RecommendBannerState extends State<RecommendBanner> {
  // 实例化BannerRepository用于获取横幅数据
  BannerRepository bannerRepository = BannerRepository();

  // 用于横幅滚动的PageController
  final PageController _pageController = PageController();
  // 当前显示的横幅页码
  int _currentPage = 0;
  // 用于自动滚动的计时器
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // 获取横幅数据
    bannerRepository.getData();
    // 启动自动滚动功能
    _startAutoScroll();
  }

  @override
  void dispose() {
    // 页面销毁时清理资源
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // 定义一个开始自动滚动的函数
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      // 每3秒滚动到下一张图
      if (_currentPage < bannerRepository.model.imageUrl.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      // 滚动动画
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // 构建UI界面
    return Container(
      width: MediaQuery.of(context).size.width, // 容器宽度
      height: 170, // 容器高度
      padding: const EdgeInsets.all(12), // 内边距
      child: FutureBuilder(
          future: bannerRepository.getData(), // 异步获取数据
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Stack(
              children: [
                // 横幅滚动视图
                PageView.builder(
                  controller: _pageController,
                  itemCount: bannerRepository.model.imageUrl.length,
                  onPageChanged: (index) {
                    // 更新当前页码
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    // 横幅图片
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(UIConfig.radius),
                      child: Image.network(
                        bannerRepository.model.imageUrl[index],
                        fit: BoxFit.fitWidth,
                      ),
                    );
                  },
                ),
                // 底部指示器
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
