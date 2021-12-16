/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/25 4:55 下午
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:myapp/mvvm/commponets/title_bar.dart';
import 'package:myapp/mvvm/page/home/page/home_detail_controller.dart';

class HomeDetailPage extends GetView<HomeDetailController> {
  final streamController = StreamController();

  @override
  Widget build(BuildContext context) {
    var data = Get.parameters;
    var name = '';
    if (null != data) {
      name = data['name'];
    }
    return Scaffold(
      appBar: TitleBar(
        title: 'Home Detail',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'hello $name',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Get.back(result: {"result": "back_param"});
              },
              child: Text('带参数返回'),
            ),
            RaisedButton(
              onPressed: () {
                streamController.sink.add(10);
              },
              child: Text('10'),
            ),
            RaisedButton(
              onPressed: () {
                streamController.sink.add('hi');
              },
              child: Text('hi'),
            ),
            RaisedButton(
              onPressed: () {
                streamController.sink.addError('error');
              },
              child: Text('error'),
            ),
            StreamBuilder(
                stream: streamController.stream,
                builder: (ctx, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('${snapshot.data}');
                    case ConnectionState.waiting:
                      return Text('${snapshot.data}');
                    case ConnectionState.active:
                      return Text('${snapshot.data}');
                    case ConnectionState.done:
                      return Text('${snapshot.data}');
                  }
                  return CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
