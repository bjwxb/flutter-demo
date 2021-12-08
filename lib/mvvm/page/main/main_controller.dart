/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/25 3:33 下午
 */
import 'package:get/get.dart';

class MainController extends GetxController {
  int tabIndex = 0;

  void changeTabIndex(int index) {
    this.tabIndex = index;
    update();
  }
}
