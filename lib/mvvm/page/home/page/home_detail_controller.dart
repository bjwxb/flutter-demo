/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/25 4:55 下午
 */
import 'package:myapp/mvvm/page/base/base_controller.dart';

class HomeDetailController extends BaseController {
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
