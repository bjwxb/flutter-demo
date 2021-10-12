import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MedicalPage extends StatefulWidget {
  const MedicalPage({Key key}) : super(key: key);

  @override
  _MedicalPageState createState() => _MedicalPageState();
}

class _MedicalPageState extends State<MedicalPage> {
  PageController _pageController;
  Timer _timer;
  int _index = 0;
  int _currentPageIndex = 0;
  StreamController<int> _streamController;
  StreamSink _sink;
  StreamSubscription _streamSubscription;
  Stream _stream;

  int num = 0;
  @override
  void initState() {
    super.initState();
    init();
    print('============= init state');
    initStream();
  }

  initStream() {
    _streamController = StreamController<int>();
    _stream = _streamController.stream;
    // _streamSubscription = _stream.listen((event) {
    //   print('------------- $event');
    //   // setState(() {
    //   //   num = event;
    //   // });
    // });
    _sink = _streamController.sink;
  }

  init() {
    _pageController = PageController(
      initialPage: _index, //默认在第几个
      viewportFraction: 1, // 占屏幕多少，1为占满整个屏幕
      keepPage: true, //是否保存当前 Page 的状态，如果保存，下次回复保存的那个 page，initialPage被忽略，
      //如果为 false 。下次总是从 initialPage 开始。
    );
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _index++;
      // _pageController.animateToPage(
      //   _index, //跳转到的位置
      //   duration: Duration(milliseconds: 800), //跳转的间隔时间
      //   curve: Curves.fastOutSlowIn, //跳转动画
      // );
    });
  }

  @override
  void didUpdateWidget(covariant MedicalPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('>>>>>>>>>>>>>>>>>');
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();

    _sink?.close();
    _streamController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _stream,
        initialData: 5,
        builder: (context, snap) {
          print("******** ${snap.data}");
          int num = snap.data;
          return Column(
            children: [
              Container(
                  height: 260,
                  child: Stack(
                    children: [
                      PageView.builder(
                        itemCount: 10000, //
                        itemBuilder: (context, index) {
                          return getWidgetList()[index % getWidgetList().length]; //无限循环
                        },
                        scrollDirection: Axis.horizontal, //滑动方向
                        pageSnapping: true, //是否有回弹效果 默认是true-一页一页滑动；false-类似于横向recyclerview
                        physics: ClampingScrollPhysics(), //边界效果如阻尼效果/水波纹效果BouncingScrollPhysics
                        controller: _pageController,
                        onPageChanged: (index) {
                          _currentPageIndex = index % getWidgetList().length;
                          setState(() {});
                        },
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(getWidgetList().length, (i) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentPageIndex == i ? Colors.yellow : Colors.grey),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  )
                  // child: PageView(
                  //   scrollDirection: Axis.horizontal,
                  //   controller: PageController(viewportFraction: 0.9),
                  //   children: getWidgetList(),
                  //   onPageChanged: (index) {
                  //     print('============= $index');
                  //   },
                  // ),
                  ),
              Container(
                margin: EdgeInsets.all(30),
                child: TextButton(
                  onPressed: () {
                    //Navigator.pop(context);
                  },
                  child: Text('test button'),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  int num = Random().nextInt(100);
                  // _sink.add(num);
                  _streamController.add(num);
                },
                child: Text('outline button $num'),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> getWidgetList() {
    return [
      Container(
        width: double.infinity,
        color: Colors.red,
        alignment: Alignment.center,
        child: Text(
          "===========================",
        ),
      ),
      Container(
        width: double.infinity,
        color: Colors.blue,
      ),
      Container(
        width: double.infinity,
        color: Colors.lightGreen,
      ),
    ];
  }
}
