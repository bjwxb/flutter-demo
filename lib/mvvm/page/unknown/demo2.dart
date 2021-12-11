/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/12/10 2:19 下午
 */
// Mixins 使我们可以在无需继承父类的情况下为此类添加父类的“功能”，可以在同一个类中具有一个父级和多个 mixin 组件。
// Mixins 不可以声明任何构造函数。
// 给 Mixins 添加限定条件使用 on 关键字。
// 混合使用 with 关键字，with 后面可以是 class、abstract class 和 mixin 的类型。
// Mixins 不是多重继承，相反，它只是在多个层次结构中重用类中的代码而无需扩展它们的一种方式。

void main() {
  final p = Person();
  p.eat();
  p.dance();
  p.sing();

  final Coder c = Coder();
  c.eat();
  c.coding();
  c.dance();
  c.sing();
}

class Person with Dance, Sing {
  eat() {
    print(">>>> person eat <<<<<");
  }
}

class Coder extends Person with Code, Dance, Sing {}

class Dog {}

//mixin的类 不能声明构造方法
mixin Code on Person {
  coding() {
    print('>>> coding <<<');
  }
}

mixin Sing {
  sing() {
    print('>>> singing <<<');
  }
}

mixin Dance {
  dance() {
    print('====== dance =====');
  }
}
