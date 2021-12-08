// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
 * 描述:AppBar封装
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2020/8/6 15:43
 */
class TitleBar extends StatefulWidget implements PreferredSizeWidget {
  //标题文本内容
  final String title;
  //是否显示返回按钮
  final bool hideBackImage;
  //appBar 背景颜色
  final Color backgroundColor;
  //appBar高度 默认设置为44
  final double height;
  //appBar 阴影 默认为0.5 相当于底线
  final double elevation;
  final List<Widget> actions;
  final bool centerTitle;
  final double titleSize;

  TitleBar(
      {this.title,
      this.hideBackImage: false,
      this.backgroundColor,
      this.elevation,
      this.height,
      this.actions,
      this.centerTitle = true,
      this.titleSize});

  @override
  _TitleBarState createState() => _TitleBarState();

  @override
  Size get preferredSize => Size.fromHeight(this.height ?? 44);
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor ?? Colors.white,
      leading: widget.hideBackImage
          ? Icon(Icons.arrow_back_ios, color: Colors.transparent)
          : InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black26,
              )),
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.black87, fontSize: widget.titleSize ?? 17),
      ),
      centerTitle: widget.centerTitle,
      elevation: widget.elevation ?? 0.5,
      brightness: Brightness.light, //影响状态栏字体颜色
      actions: widget.actions,
    );
  }
}
