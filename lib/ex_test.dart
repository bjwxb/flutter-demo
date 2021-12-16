/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/12 5:20 下午
 */

class Ex {}

String getName() {
  print('---future vaule');
  return 'July';
}

void main() {
  //1. 先执行main isolate中的语句
  print("===== main start =====");

  Future.sync(() => print('------ future-sync'));
  Future.value(getName());
  Future.delayed(Duration(seconds: 1), () {
    print("***** future delayed ******");
  });

  Future.sync(() => print('>>>>>> sync 消息'));

  Future.wait([
    //wait表示多个任务都完成之后的回调
    // 2秒后返回结果
    Future.delayed(new Duration(seconds: 2), () {
      return "hello";
    }),
    // 4秒后返回结果
    Future.delayed(new Duration(seconds: 4), () {
      return " world";
    })
  ]).then((results) {
    print(results[0] + results[1]);
  }).catchError((e) {
    print(e);
  });

  //3. 执行事件队列中的消息
  Future(() {
    //sleep(Duration(seconds: 2));//会阻塞当前线程，延迟Future.delayed的执行
    print('>>>> normal futuer <<<<<');
  });

  //2. 在执行微任务队列中的消息
  Future.microtask(() => print('_+_+_+_+_+_+_+_+ microtask =='));

  //1. 先执行main isolate中的语句
  print('------ main end -----');
}
