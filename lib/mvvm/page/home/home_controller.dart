import 'package:get/get.dart';

/*
 * 描述: home controller
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/25 3:36 下午
 */
class HomeController extends GetxController {
  var list = ['Java', "Python", "Flutter"].obs;

  var btnTip = "页面跳转".obs;

  void updateList(String content) {
    list.add(content);
  }
}
