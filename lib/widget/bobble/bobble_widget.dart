import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/widget/bobble/blur_widget.dart';

import 'bobble_bean.dart';

/*
 * 描述: 气泡背景
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/11 2:04 下午
 */
class BobbleWidget extends StatefulWidget {
  const BobbleWidget({Key key}) : super(key: key);

  @override
  _BobbleWidgetState createState() => _BobbleWidgetState();
}

class _BobbleWidgetState extends State<BobbleWidget> with TickerProviderStateMixin {
  List<BobbleBean> _list = [];

  Random _random = new Random(DateTime.now().microsecondsSinceEpoch);

  // 运动速度控制
  double _maxSpeed = 0.6;

  // 设置最大半径
  double _maxRadius = 60;

  // 设置最大角度
  double _maxTheta = 2 * pi;

  AnimationController _animationController;

  AnimationController _fadeAnimationController;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 10; i++) {
      BobbleBean bean = new BobbleBean();

      bean.color = getRandomWhiteColor(_random);
      if (i.isEven) {
        bean.position = Offset(_random.nextDouble() * 300, -50);
      } else {
        bean.position = Offset(_random.nextDouble() * 300, 3090);
      }

      bean.speed = _random.nextDouble() * _maxSpeed;

      bean.radius = _random.nextDouble() * _maxRadius + 50;
      bean.theta = _random.nextDouble() * _maxTheta;

      _list.add(bean);
    }
    //创建动画控制器 1秒
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 5));
    // 执行刷新监听
    _animationController.addListener(() {
      setState(() {});
    });
    // 重复执行
    _animationController.repeat();

    _fadeAnimationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 1800));
    _fadeAnimationController.forward();
    _fadeAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _fadeAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // 第一部分 渐变背景
            buildBackground(),
            // 第二部分 气泡
            buildBobbleWeight(context),
            //  第三部分 高斯模糊
            buildBlurWeight(),
          ],
        ),
      ),
    );
  }

  // 第一部分 渐变背景
  buildBackground() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
        Colors.lightBlueAccent.withOpacity(0.2),
        Colors.blueAccent.withOpacity(0.3),
        Colors.blue.withOpacity(0.4),
      ])),
    );
  }

  buildBobbleWeight(BuildContext context) {
    //画板
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: CustomMyPainter(list: _list, random: _random),
    );
  }

  buildBlurWeight() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        color: Colors.white10.withOpacity(0.2),
      ),
    );
    return Container(
      width: 300,
      height: 300,
      alignment: Alignment.center,
      child: BlurOvalWidget(Text('hello world' * 3)),
    );
  }
}

class CustomMyPainter extends CustomPainter {
  List<BobbleBean> list;

  Random random;

  Paint _paint = new Paint()..isAntiAlias = true;

  CustomMyPainter({this.list, this.random});

  @override
  void paint(Canvas canvas, Size size) {
    list.forEach((element) {
      Offset newCenterOffset = calculateXY(element.speed, element.theta);

      double dx = newCenterOffset.dx + element.position.dx;
      double dy = newCenterOffset.dy + element.position.dy;

      if (dx < -200 || dx > size.width + 100 || dy < -200 || dy > size.height + 200) {
        print(">>>> dx = $dx >>> dy = $dy");
        dx = random.nextDouble() * size.width;
        if (list.indexOf(element).isEven) {
          dy = -50;
        } else {
          dy = size.height + 50;
        }
      }

      element.position = Offset(dx, dy);
    });

    list.forEach((element) {
      _paint.color = element.color;

      canvas.drawCircle(element.position, element.radius, _paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Offset calculateXY(double speed, double theta) {
    return Offset(speed * cos(theta), speed * sin(theta));
  }
}
