/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/26 10:14 上午
 */

import 'package:myapp/mvvm/page/base/base_controller.dart';

class SettingController extends BaseController {
  var name = "July";

  void changeName(String name) {
    this.name = name;
    update();
  }

  getData() {
    Future.delayed(Duration(seconds: 2), () {
      setError(null);
    });
  }

  getSuccessData() {
    Future.delayed(Duration(seconds: 2), () {
      setSuccess();
    });
  }
}
