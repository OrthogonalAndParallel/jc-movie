import 'dart:ui';

import 'package:aurora/aurora.dart';
import 'package:catmovie/app/modules/home/views/tv.dart';
import 'package:catmovie/app/widget/k_body.dart';
import 'package:catmovie/app/widget/zoom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:catmovie/app/modules/home/views/index_home_view.dart';
import 'package:catmovie/app/modules/home/views/settings_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:xi/xi.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final List<Widget> _views = [
    const IndexHomeView(),
    const TVUI(),
    const SettingsView(),
  ];

  final List<Map<String, dynamic>> _tabs = [
    {
      "icon": CupertinoIcons.home,
      "title": "首页",
      "color": Colors.blue,
    },
    {
      "icon": CupertinoIcons.tv,
      "title": "电视",
      "color": Colors.orange,
    },
    {
      "icon": CupertinoIcons.settings,
      "title": "设置",
      "color": Colors.pink,
    },
  ];

  List<ISpiderAdapter> get mirror => controller.mirrorList;

  int get mirrorIndex => controller.mirrorIndex;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.isDarkMode;
    Color color = isDark
        ? const Color.fromRGBO(0, 0, 0, .63)
        : const Color.fromRGBO(255, 255, 255, .63);
    return GetBuilder<HomeController>(
      builder: (homeview) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
            children: [
              Positioned.fill(
                child: Aurora(
                  size: 88,
                  colors: [
                    Color(0xffc2e59c).withValues(alpha: .24),
                    Color(0xff64b3f4).withValues(alpha: .24)
                  ],
                  blur: 42,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                width: 88,
                child: Aurora(
                  size: 88,
                  colors: [
                    Color(0xFFff0f7b), Color(0xFFf89b29),
                    // Color(0xFF595cff), Color(0xFFc6f8ff),
                  ],
                  blur: 120,
                ),
              ),
              Positioned(
                top: 120,
                right: 12,
                width: 88,
                child: Aurora(
                  size: 88,
                  colors: [
                    // Color(0xFFff0f7b), Color(0xFFf89b29),
                    Color(0xFF595cff), Color(0xFFc6f8ff),
                  ],
                  blur: 120,
                ),
              ),
              Positioned.fill(
                child: PageView.builder(
                  controller: homeview.currentBarController,
                  itemBuilder: (context, index) {
                    return _views[index];
                  },
                  itemCount: _views.length,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    // fix ios keyboard auto up
                    var currentFocus = FocusScope.of(context);
                    currentFocus.unfocus();
                    EasyLoading.dismiss();
                    controller.focusNode.requestFocus();
                    homeview.changeCurrentBarIndex(index);
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: homeview.showBottomNavigationBar
              ? BottomAppBar(
                  elevation: 0,
                  color: homeview.currentBarIndex == 2
                      ? Colors.transparent
                      : color,
                  padding: EdgeInsets.zero,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: SizedBox(
                      height: kDefaultAppBottomBarHeight,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 360,
                              ),
                              child: SalomonBottomBar(
                                itemPadding: const EdgeInsets.symmetric(
                                  vertical: 9,
                                  horizontal: 18,
                                ),
                                currentIndex: homeview.currentBarIndex,
                                onTap: (int i) {
                                  homeview.changeCurrentBarIndex(i);
                                },
                                items: _tabs
                                    .map(
                                      (e) => SalomonBottomBarItem(
                                        icon: Zoom(child: Icon(e['icon'])),
                                        title: Text(e['title']),
                                        selectedColor: e['color'],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : null,
        extendBody: homeview.showBottomNavigationBar,
      ),
    );
  }
}
