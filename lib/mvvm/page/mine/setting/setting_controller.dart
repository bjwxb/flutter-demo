/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/26 10:14 上午
 */
import 'package:get/get.dart';

class SettingController extends GetxController {
  var name = "July";

  void changeName(String name) {
    this.name = name;
    update();
  }
}
