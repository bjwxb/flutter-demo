import 'package:get/get.dart';
import 'package:myapp/mvvm/page/home/page/home_detail_controller.dart';

/*
 * 描述:
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/12/27 5:34 下午
 */
class HomeDetailBinding extends Bindings {
  HomeDetailBinding();

  @override
  void dependencies() {
    Get.lazyPut<HomeDetailController>(() => HomeDetailController());
  }
}
