/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/12/10 3:51 下午
 */
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaterRipplePainter extends CustomPainter {
  final double progress;
  final Color color;
  final int count;

  WaterRipplePainter(this.progress, {this.color = Colors.blue, this.count = 6});

  Paint p = Paint()..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    final sw = size.width;
    final sh = size.height;
    final radius = math.min(sw, sh) / 2;
    final Offset offset = Offset(sw / 2, sh / 2);

    for (int i = 0; i < count; i++) {
      final double opacity = (1.0 - ((i + progress) / count));
      final Color _color = color.withOpacity(opacity);
      p..color = _color;
      double _radius = radius * ((i + progress) / count);
      print('$_radius===== $opacity');
      canvas.drawCircle(offset, _radius, p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
