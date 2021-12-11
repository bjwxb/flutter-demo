/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/26 10:14 上午
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/mvvm/commponets/title_bar.dart';
import 'package:myapp/mvvm/page/mine/mine_controller.dart';
import 'package:myapp/mvvm/page/mine/setting/setting_controller.dart';
import 'package:myapp/widget/bobble/bobble_bean.dart';

/*
 * key : 1. globalKey - a. 可以通过key.currentState 跨widget访问状态/请求方法; b.可以在widget树改变时保存widget状态
 *       2. localKey
 */
class SettingPage extends StatelessWidget {
  // final SettingController controller = SettingController();
  // final SettingController controller = Get.put(SettingController());
  final MineController mineController = Get.find<MineController>();

  List<Widget> list;
  @override
  Widget build(BuildContext context) {
    list = [StateLessContainer(), StateLessContainer()];
    return Scaffold(
      appBar: TitleBar(
        title: '设置',
      ),
      body: GetBuilder<SettingController>(
        builder: (controller) {
          return Container(
            color: Colors.lightBlueAccent,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('My name is ${controller.name}'),
                Container(
                  child: RaisedButton(
                    onPressed: () {
                      controller.changeName("Jack");
                      mineController.increaseCount();
                    },
                    child: Text('点击修改名字'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class StateLessContainer extends StatelessWidget {
  final color = getRandomWhiteColor(Random(255));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}
