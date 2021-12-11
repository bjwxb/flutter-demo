import 'package:flutter/material.dart';
import 'package:myapp/mvvm/view/water_ripple_painter.dart';

/*
 * 描述:
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/12/10 3:56 下午
 */
class WaterRippleWidget extends StatefulWidget {
  const WaterRippleWidget({Key key}) : super(key: key);

  @override
  _WaterRippleWidgetState createState() => _WaterRippleWidgetState();
}

class _WaterRippleWidgetState extends State<WaterRippleWidget> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 4))..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, builder) {
          return CustomPaint(
            painter: WaterRipplePainter(_controller.value),
          );
        });
  }
}
