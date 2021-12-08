/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/25 3:35 下午
 */
import 'package:get/get.dart';

class MineController extends GetxController {
  var count = 1.obs;

  void increaseCount() {
    count++;
  }
}
