import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:myapp/mvvm/page/mine/mine_controller.dart';
import 'package:myapp/mvvm/routes/app_route.dart';
import 'package:myapp/mvvm/view/water_ripple_widget.dart';

/*
 * 描述: tab -  我的
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/25 3:30 下午
 */
class MinePage extends GetView<MineController> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [Box(), Box()];
    return Scaffold(
      // appBar: TitleBar(
      //   hideBackImage: true,
      //   title: 'mine',
      // ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey.withOpacity(0.2),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Obx(() => Text("Counter ${controller.count.value}")),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
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
              margin: EdgeInsets.only(top: 20),
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
            Container(
              padding: EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 200,
              child: WaterRippleWidget(),
            )
          ],
        ),
      ),
    );
  }
}

class StateBox extends StatefulWidget {
  const StateBox({Key key}) : super(key: key);

  @override
  _StateBoxState createState() => _StateBoxState();
}

class _StateBoxState extends State<StateBox> {
  final color = randomColor();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

class Box extends StatelessWidget {
  Box({Key key}) : super(key: key);
  final color = randomColor();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

Color randomColor() {
  return Color.fromARGB(255, Random().nextInt(256) + 0, Random().nextInt(256) + 0, Random().nextInt(256) + 0);
}
