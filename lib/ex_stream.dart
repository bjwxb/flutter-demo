/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/12/15 4:17 下午
 */
void main() {
  final future = Future.delayed(Duration(seconds: 1), () => 36);
  final stream = Stream.periodic(Duration(seconds: 1), (_) => 77);

  future.then((value) => print("===== $value"));
  stream.listen((event) {
    print(">>>>> $event");
  });
}
