import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:myapp/mvvm/commponets/title_bar.dart';
import 'package:myapp/mvvm/page/home/home_controller.dart';
import 'package:myapp/mvvm/routes/app_route.dart';

/*
 * 描述: tab - 首页
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/25 3:28 下午
 */
class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(
        hideBackImage: true,
        title: 'home',
      ),
      body: Material(
        color: Colors.grey,
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.list.map((e) => Text('$e')).toList(),
                  );
                }),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () {
                    controller.updateList('android');
                  },
                  child: Text(
                    'change controller',
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                  style: ButtonStyle(
                    //背景颜色
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      //设置按下时的背景颜色
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue.withOpacity(0.8);
                      }
                      //默认不使用背景颜色
                      return Colors.blue.withOpacity(0.5);
                    }),
                    //设置水波纹颜色
                    overlayColor: MaterialStateProperty.all(Colors.blue),
                    //设置按钮内边距
                    padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                    //设置按钮的大小
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    //设置边框
                    // side: MaterialStateProperty.all(BorderSide(color: Colors.grey, width: 1)),
                    //外边框装饰 会覆盖 side 配置的样式
                    // shape: MaterialStateProperty.all(StadiumBorder()),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () async {
                    // Get.to(HomeDetailPage());//直接跳转
                    // Get.to(AppRoutes.homeDetail);//通过注册的路由表名字跳转
                    // Get.off(HomeDetailPage());//跳转页面并关闭之前的页面
                    // Get.offAll(HomeDetailPage());//跳转页面并关闭之前的全部页面
                    // Get.offNamed('/');//通过路由关闭跳转
                    // Get.offAllNamed('/');
                    // Get.toNamed('/');
                    var res = await Get.toNamed(AppRoutes.homeDetail, parameters: {"name": "July"});
                    if (null != res) {
                      controller.btnTip.value = '返回参数 - ${res['result']}';
                      Get.snackbar("返回值", "success -> " + res["result"].toString(), backgroundColor: Colors.white);
                    }
                  },
                  child: Obx(() {
                    return Text(
                      '${controller.btnTip.value}',
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    );
                  }),
                  style: ButtonStyle(
                    //背景颜色
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      //设置按下时的背景颜色
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue.withOpacity(0.8);
                      }
                      //默认不使用背景颜色
                      return Colors.blue.withOpacity(0.5);
                    }),
                    //设置水波纹颜色
                    overlayColor: MaterialStateProperty.all(Colors.blue),
                    //设置按钮内边距
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
                    //设置按钮的大小
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    //设置边框
                    // side: MaterialStateProperty.all(BorderSide(color: Colors.grey, width: 1)),
                    //外边框装饰 会覆盖 side 配置的样式
                    // shape: MaterialStateProperty.all(StadiumBorder()),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: RaisedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.unknownRote);
                  },
                  color: Colors.blueAccent,
                  child: Text('跳转错误路由'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
