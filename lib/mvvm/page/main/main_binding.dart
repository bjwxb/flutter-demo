/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/25 3:34 下午
 */
import 'package:get/get.dart';
import 'package:myapp/mvvm/page/medic/medic_controller.dart';
import 'package:myapp/mvvm/page/mine/mine_controller.dart';

import '../home/home_controller.dart';
import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MedicController>(() => MedicController());
    Get.lazyPut<MineController>(() => MineController());
  }
}
