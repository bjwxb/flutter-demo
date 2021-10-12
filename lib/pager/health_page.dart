import 'dart:isolate';
import 'dart:math';

import 'package:flutter/material.dart';

//健康
class HealthPage extends StatefulWidget {
  const HealthPage({Key key}) : super(key: key);

  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  var _content = "health pager";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () async {
          print('>>>==== thread name is ${Isolate.current.debugName}');
          isolateTest();
        },
        child: Center(
          child: Text("$_content"),
        ),
      ),
    );
  }

  Isolate _isolate;
  Future<dynamic> isolateTest() async {
    final rp = ReceivePort();
    _isolate = await Isolate.spawn(entryPoint, rp.sendPort);

    rp.listen((message) {
      _content = message;
      print('${Isolate.current.debugName}------- $message');
      setState(() {});
      _isolate?.kill(priority: Isolate.immediate);
    });
  }
}

//子Isolate对象的入口函数，可以在该函数中做耗时操作
entryPoint(SendPort sendPort) {
  print('>>> thread name is ${Isolate.current.debugName}');
  sendPort.send("hello, I from isolate ${Random().nextInt(10)}");
}
