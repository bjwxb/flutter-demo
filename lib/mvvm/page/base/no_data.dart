// @dart=2.9
import 'package:flutter/material.dart';

/*
 * 描述:
 * 创建者: wuxiaobo
 * 邮箱: wuxiaobo@xinzhili.cn
 * 日期: 2020/4/24 16:25
 */
class NoDataView extends StatefulWidget {
  final VoidCallback emptyRetry; //无数据事件处理
  final String desc;

  NoDataView(this.emptyRetry, {this.desc});

  @override
  _NoDataViewState createState() => _NoDataViewState();
}

class _NoDataViewState extends State<NoDataView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(bottom: 200),
        child: InkWell(
          onTap: widget.emptyRetry,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 160,
                height: 160,
                child: Icon(Icons.network_check_sharp),
              ),
              Text(
                widget.desc ?? '暂无数据',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              )
            ],
          ),
        ));
  }
}
