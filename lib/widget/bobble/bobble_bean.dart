import 'dart:math';
import 'dart:ui';

/*
 * 描述:气泡对象
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/11 1:59 下午
 */
class BobbleBean {
  //位置
  Offset position;
  //颜色
  Color color;
  //运动的速度
  double speed;
  //角度
  double theta;
  //半径
  double radius;
}

//全局定义获取颜色的方法
Color getRandomWhiteColor(Random random) {
  int a = random.nextInt(60) + 30;
  return Color.fromARGB(a, 255, 11, 255);
}
