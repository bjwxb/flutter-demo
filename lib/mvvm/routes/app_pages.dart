/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/25 3:28 下午
 */
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:myapp/mvvm/page/home/page/home_detail.dart';
import 'package:myapp/mvvm/page/main/main.dart';
import 'package:myapp/mvvm/page/main/main_binding.dart';
import 'package:myapp/mvvm/page/mine/setting/setting.dart';
import 'package:myapp/mvvm/page/unknown/unknown.dart';

import 'app_route.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.root,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(name: AppRoutes.homeDetail, page: () => HomeDetailPage()),
    GetPage(
      name: AppRoutes.mineSetting,
      page: () => SettingPage(),
      transition: Transition.downToUp,
      binding: MainBinding(),
    ),
  ];

  static final unknownPage = GetPage(name: AppRoutes.unknownRote, page: () => UnknownPage());
}
