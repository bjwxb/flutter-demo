import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ButtonAppTest());

class ButtonAppTest extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "text wedgit",
      home: new Scaffold(
        appBar: AppBar(
          title: Text("button wedgit example", style: TextStyle(color: Colors.red),),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){

            },
          ),
          actions: <Widget>[//右边菜单
            Padding(
              child: Icon(Icons.add),
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            ),
          ],
          backgroundColor: Colors.blue,
          elevation: 6.0,//顶部bar阴影
//          backgroundColor: Color.fromARGB(0, 1, 1, 1),
        ),
        body: new Container(
//          color: Colors.black12,
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(10),//外边距
//          decoration: BoxDecoration(
//            border: Border.all(width: 2, color: Colors.blue),
//            gradient: const LinearGradient(
//                colors:[Colors.black12, Colors.black38, Colors.red])
//          ),
//          alignment: Alignment.centerLeft,
          child: DefaultTextStyle(
            style: TextStyle(
                color: Colors.blue,
                fontSize: 14
            ),
            child: Column(
              children: <Widget>[
                Text("test default color"),
                RaisedButton(//即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
                  child: Text("确定"),
                  onPressed: (){},
                  onLongPress: (){},
//                  textColor: Colors.red,//文字颜色
                  disabledColor: Colors.black12,
                  highlightColor: Colors.black12,//按下时颜色
                  splashColor: Colors.red,//水波纹颜色
                  elevation: 5,//阴影
                ),
                FlatButton(//扁平按钮，默认背景透明并不带阴影。按下后，会有背景色
                  child: Text("取消"),
                  onPressed: (){},
                  textColor: Colors.red,//文字颜色
                ),
                OutlineButton(//默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
                  child: Text("登陆"),
                  onPressed: (){},
                  textColor: Colors.red,//文字颜色
                  borderSide: BorderSide(width: 1, color: Colors.deepOrange),
                  highlightedBorderColor: Colors.red,
                ),
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  color: Colors.red,
                  onPressed: (){},
                  iconSize: 24,
                  enableFeedback: true,//???
                ),
                OutlineButton.icon(//RaisedButton、FlatButton、OutlineButton都有一个icon 构造函数，通过它可以轻松创建带图标的按钮
                  icon: Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.blue,
                  ),
                  label: Text("添加"),
                  padding: const EdgeInsets.all(5),
                  onPressed: (){},
                  highlightElevation: 3,//点击阴影
                  textColor: Colors.red,//文字颜色
                  borderSide: BorderSide(width: 1, color: Colors.deepOrange),
                  highlightedBorderColor: Colors.red,
                ),
                RaisedButton(//自定义按钮性状
                  child: Text("确认"),
                  onPressed: (){},
                  onLongPress: (){},
                  textColor: Colors.red,//文字颜色
                  focusColor: Colors.white,
                  color: Colors.lightBlue,
                  highlightColor: Colors.blue[600],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                DecoratedBox(//DecoratedBox可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                        borderRadius: BorderRadius.circular(3.0), //3像素圆角
                        border: Border.all(color: Colors.black, width: 3, style: BorderStyle.solid),
                        boxShadow: [ //阴影
                          BoxShadow(
                              color:Colors.black54,
                              offset: Offset(2.0,2.0),
                              blurRadius: 4.0
                          )
                        ]
                    ),
                    position: DecorationPosition.background,
                    child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 38.0),
                      child: Text("Login", style: TextStyle(color: Colors.white),),
                    )
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  color: Colors.black,
                  child: new Transform(
                    alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                    transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                    child: new Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.deepOrange,
                      child: const Text('Apartment for rent!'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}