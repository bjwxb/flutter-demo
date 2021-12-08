import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:myapp/mvvm/page/medic/medic.dart';
import 'package:myapp/mvvm/page/mine/mine.dart';

import '../home/home.dart';
import 'main_controller.dart';

/*
 * 描述: 主页
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/25 3:31 下午
 */
class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [HomePage(), MedicPage(), MinePage()],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            type: BottomNavigationBarType.fixed,
            // showSelectedLabels: false,
            // showUnselectedLabels: false,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.home,
                label: '首页',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.book,
                label: '服药',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.person,
                label: '我的',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({IconData icon, String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
