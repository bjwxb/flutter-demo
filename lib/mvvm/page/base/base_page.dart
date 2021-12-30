/*
 * 描述: 
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2021/12/27 5:55 下午
 */
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:myapp/mvvm/commponets/title_bar.dart';
import 'package:myapp/mvvm/page/base/base_controller.dart';

import 'load_state.dart';

abstract class BasePage<T extends BaseController> extends GetView<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(
        title: 'Home Detail',
      ),
      body: _buildBody(context, controller),
    );
  }

  Widget _buildBody(BuildContext context, BaseController controller) {
    return Obx(() {
      return LoadStateLayout(
        state: controller.state.value,
        errorRetry: () => retry,
        emptyRetry: () => retry,
        successWidget: buildWidget(context),
      );
    });
  }

  Widget buildWidget(BuildContext context);

  void retry() {}
}
