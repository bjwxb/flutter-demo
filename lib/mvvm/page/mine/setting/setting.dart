/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/10/26 10:14 上午
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:myapp/mvvm/commponets/title_bar.dart';
import 'package:myapp/mvvm/page/base/base_page.dart';
import 'package:myapp/mvvm/page/mine/mine_controller.dart';
import 'package:myapp/mvvm/page/mine/setting/setting_controller.dart';
import 'package:myapp/widget/bobble/bobble_bean.dart';

/*
 * key : 1. globalKey - a. 可以通过key.currentState 跨widget访问状态/请求方法; b.可以在widget树改变时保存widget状态
 *       2. localKey
 */
class SettingPage extends BasePage<SettingController> {
  // final SettingController controller = SettingController();
  // final SettingController controller = Get.put(SettingController());
  final MineController mineController = Get.find<MineController>();

  @override
  Widget buildWidget(BuildContext context) {
    controller.getData();

    return Container(
      color: Colors.red,
    );
  }

  Widget buildww(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(
        title: '设置',
      ),
      body: GetBuilder<SettingController>(
        builder: (controller) {
          return Container(
            color: Colors.lightBlueAccent,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('My name is ${controller.name}'),
                Container(
                  child: RaisedButton(
                    onPressed: () {
                      controller.changeName("Jack");
                      mineController.increaseCount();
                      //(context as Element).markNeedsBuild();
                    },
                    child: Text('点击修改名字'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    return Center(
      child: Container(
        color: Colors.red[100],
        // alignment: Alignment.center,
        child: MyRenderBox(
          child: FlutterLogo(
            size: 100,
          ),
        ),
      ),
    );
    return Container(
      color: Colors.red[100],
      child: CustomMultiChildLayout(
        delegate: MyDelegate(),
        children: [
          LayoutId(
            id: 1,
            child: FlutterLogo(
              size: 50,
            ),
          ),
          LayoutId(
            id: 2,
            child: FlutterLogo(),
          ),
        ],
      ),
    );

    return Container(
        color: Colors.grey,
        alignment: AlignmentDirectional.center,
        child: LayoutBuilder(
          builder: (BuildContext cxt, Constraints c) {
            print('>>>> ${c.toString()}');
            return Container(
              color: Colors.blue,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      color: Colors.red,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Text("hello world"),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      color: Colors.red,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class StateLessContainer extends StatelessWidget {
  final color = getRandomWhiteColor(Random(255));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

class MyDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    Size size1, size2;
    if (hasChild(1)) {
      size1 = layoutChild(1, BoxConstraints.loose(Size(400, 400)));
      positionChild(1, Offset(10, 10));
    }
    if (hasChild(2)) {
      size2 = layoutChild(2, BoxConstraints(minWidth: 100, maxHeight: 100, minHeight: 100, maxWidth: 100));
      positionChild(2, Offset(0, size1.height));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}

class MyRenderBox extends SingleChildRenderObjectWidget {
  MyRenderBox({Widget child}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderMyRenderBox();
  }
}

class RenderMyRenderBox extends RenderBox with RenderObjectWithChildMixin, DebugOverflowIndicatorMixin {
  @override
  void performLayout() {
    child.layout(constraints, parentUsesSize: true); //parentUsesSize实现重绘边界
    size = (child as RenderBox).size;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child, offset + Offset(50, 50));
    context.paintChild(child, offset + Offset(0, 0));

    paintOverflowIndicator(
      context,
      offset,
      offset & size,
      Rect.fromLTWH(0, 0, 200, 200),
    );
  }
}
