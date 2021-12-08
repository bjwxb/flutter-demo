import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:myapp/mvvm/commponets/title_bar.dart';
import 'package:myapp/mvvm/page/dialog/dial_tel.dart';
import 'package:myapp/mvvm/themes/app_theme.dart';

/*
 * 描述: tab - 服药
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/25 3:31 下午
 */
class MedicPage extends GetView<MedicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(
        hideBackImage: true,
        title: 'medic',
      ),
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9Xx]")),
                  LengthLimitingTextInputFormatter(18)
                ],
                controller: TextEditingController(text: ''),
                textAlign: TextAlign.start,
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.next,
                // inputFormatters: [LengthLimitingTextInputFormatter(18)],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 5),
                  border: InputBorder.none,
                  hintText: '请填写你的身份证号码',
                ),
                onChanged: (idNum) {},
                autofocus: false,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: '标题',
                      titleStyle: TextStyle(color: Colors.red, fontSize: 17),
                      radius: 5,
                      titlePadding: EdgeInsets.only(top: 12),
                      // middleText: "中间的提示语",
                      // middleTextStyle: TextStyle(fontSize: 15, color: Colors.black87),
                      content: Text("中间显示的widget"),
                      textConfirm: '确定',
                      confirmTextColor: Colors.black,
                      cancelTextColor: Colors.grey,
                      confirm: MaterialButton(
                        onPressed: () {},
                        color: Colors.blue,
                        child: Text('确定'),
                      ),
                      cancel: MaterialButton(
                        onPressed: () {
                          Get.back();
                        },
                        color: Colors.blue,
                        child: Text('取消'),
                      ),
                      onConfirm: () {
                        Get.back();
                      },
                      textCancel: "取消",
                      // actions: [Icon(Icons.ac_unit), Icon(Icons.ac_unit_outlined)]
                    );
                  },
                  child: Text(
                    '默认dialog',
                    style: TextStyle(fontSize: 15, color: Colors.white),
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
                margin: EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () async {
                    Get.dialog(DialTelDialog());
                  },
                  child: Text(
                    '自定义dialog',
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
                    Get.snackbar(
                      "title",
                      "提示内容",
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      borderRadius: 3,
                    );
                  },
                  color: Colors.blueAccent,
                  child: Text('snackbar 提示框'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: RaisedButton(
                  onPressed: () {
                    print('>>>== ${Get.isDarkMode}');
                    Get.bottomSheet(
                      Material(
                        color: Colors.white,
                        child: Wrap(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.wb_sunny_outlined,
                                color: Colors.black,
                              ),
                              title: Text(
                                "白天模式",
                                style: TextStyle(color: !Get.isDarkMode ? Colors.red : Colors.black),
                              ),
                              onTap: () {
                                Get.changeTheme(AppTheme.light);
                                Get.back();
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.wb_sunny,
                                color: Colors.black,
                              ),
                              title: Text(
                                "黑夜模式",
                                style: TextStyle(color: Get.isDarkMode ? Colors.red : Colors.black),
                              ),
                              onTap: () {
                                Get.changeTheme(AppTheme.dark);
                                Get.back();
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  color: Colors.blueAccent,
                  child: Text('bottom sheet'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
