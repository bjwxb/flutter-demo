import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:myapp/routes/Application.dart';
import 'package:myapp/routes/routes.dart';

//我的
class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () async {
          print("-------${await asyncFibonacci(20)}");
          Application.router.navigateTo(context, Routes.bobble);
        },
        child: Center(
          child: Text("mine pager"),
        ),
      ),
    );
  }

  Future<dynamic> asyncFibonacci(int n) async {
    //首先创建一个ReceivePort，为什么要创建这个？
    //因为创建isolate所需的参数，必须要有SendPort，SendPort需要ReceivePort来创建
    final rp = ReceivePort();
    //开始创建isolate,Isolate.spawn函数是isolate.dart里的代码,_isolate是我们自己实现的函数
    //_isolate是创建isolate必须要的参数。_isolate必须是静态的或顶级函数
    // await Isolate.spawn(_isolate, rp.sendPort);
    await Isolate.spawn(_isolate2, ParamBean("hello world", rp.sendPort));

    //获取sendPort发送来的数据
    // final sendPort = await rp.first as SendPort;
    //接受消息的receivePort
    // final receivePort = ReceivePort();
    // sendPort.send([n, receivePort.sendPort]);

    //获取数据并返回
    return rp.first;
  }
}

class ParamBean {
  final String param;
  final SendPort sendPort;

  ParamBean(this.param, this.sendPort);
}

_isolate2(ParamBean bean) {
  //bind
  String content = bean.param + ", nice to meet you.";
  bean.sendPort.send(content);
}

_isolate(SendPort sendPort) {
  final port = ReceivePort();
  //bind
  sendPort.send(port.sendPort);

  //listener
  port.listen((message) {
    //获取数据并解析
    final data = message[0] as int;
    final send = message[1] as SendPort;

    //返回结果
    send.send(syncFibonacci(data));
  });
}

int syncFibonacci(int n) {
  return n < 2 ? n : syncFibonacci(n - 2) + syncFibonacci(n - 1);
}
