// @dart=2.9
//四种视图状态
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'no_data.dart';

enum LoadState { State_Success, State_Error, State_Loading, State_Empty, No_Network }

///根据不同状态来展示不同的视图
class LoadStateLayout extends StatefulWidget {
  final LoadState state; //页面状态
  final Widget successWidget; //成功视图
  final VoidCallback errorRetry; //错误事件处理
  final VoidCallback emptyRetry; //空数据事件处理
  final Widget emptyWidget; //空数据试图
  final Widget failWidget; //成功视图
  final Widget loadWidget; // 加载视图

  LoadStateLayout(
      {Key key,
      this.state = LoadState.State_Loading, //默认为加载状态
      this.successWidget,
      this.errorRetry,
      this.emptyRetry,
      this.emptyWidget,
      this.failWidget,
      this.loadWidget})
      : super(key: key);

  @override
  _LoadStateLayoutState createState() => _LoadStateLayoutState();
}

class _LoadStateLayoutState extends State<LoadStateLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //宽高都充满屏幕剩余空间
      width: double.infinity,
      height: double.infinity,
      child: _buildWidget,
    );
  }

  ///根据不同状态来显示不同的视图
  Widget get _buildWidget {
    switch (widget.state) {
      case LoadState.State_Success:
        return widget.successWidget;
        break;
      case LoadState.State_Error:
        return widget.failWidget ?? _errorView;
        break;
      case LoadState.State_Loading:
        return widget.loadWidget ?? _loadingView;
        break;
      case LoadState.State_Empty:
        return widget.emptyWidget ?? NoDataView(widget.emptyRetry);
        break;
      default:
        return Container();
    }
  }

  ///加载中视图
  Widget get _loadingView {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      color: Colors.grey[200],
      child: Container(
        height: 200,
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            CupertinoActivityIndicator(),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                ' 拼命加载中...',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            )
          ],
        ),
      ),
    );
  }

  ///错误视图
  Widget get _errorView {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[200],
        padding: EdgeInsets.only(bottom: 200),
        child: InkWell(
          onTap: widget.errorRetry,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 180,
                height: 180,
                child: Icon(Icons.network_check_sharp),
              ),
              Text(
                "加载失败，请点击屏幕重试",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          ),
        ));
  }
}
