import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:myapp/mvvm/page/mine/mine_controller.dart';
import 'package:myapp/mvvm/routes/app_route.dart';

/*
 * 描述: tab -  我的
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/25 3:30 下午
 */
class MinePage extends GetView<MineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TitleBar(
      //   hideBackImage: true,
      //   title: 'mine',
      // ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey.withOpacity(0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text("Counter ${controller.count.value}")),
            Container(
              margin: EdgeInsets.only(top: 66),
              child: TextButton(
                onPressed: () {
                  controller.increaseCount();
                  // controller.count++;
                },
                child: Text(
                  'increase',
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
              margin: EdgeInsets.only(top: 66),
              child: TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.mineSetting);
                },
                child: Text(
                  'jump to setting page',
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
          ],
        ),
      ),
    );
  }
}
