/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/12/10 2:00 下午
 */
import 'dart:async';

void dartLoopTest() {
  Future x0 = Future(() => null);
  Future x = Future(() => print('1')); //6
  Future(() => print('2')); //9
  scheduleMicrotask(() => print('3')); //2
  x.then((value) {
    print('4'); //7
    Future(() => print('5')); //10
  }).then((value) => print('6')); //8
  print('7'); // 1
  x0.then((value) {
    print('8'); //3
    scheduleMicrotask(() {
      print('9'); //5
    });
    Future(() => print('11'));
  }).then((value) => print('10')); //4
}

void main() {
  dartLoopTest();
}
