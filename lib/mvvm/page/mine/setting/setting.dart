/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/26 10:14 上午
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/mvvm/commponets/title_bar.dart';
import 'package:myapp/mvvm/page/mine/mine_controller.dart';
import 'package:myapp/mvvm/page/mine/setting/setting_controller.dart';

class SettingPage extends StatelessWidget {
  // final SettingController controller = SettingController();
  final SettingController controller = Get.put(SettingController());
  final MineController mineController = Get.find<MineController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(
        title: '设置',
      ),
      body: GetBuilder<SettingController>(
        builder: (controller) {
          return Container(
            color: Colors.red,
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
