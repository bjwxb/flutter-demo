import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "text wedgit",
      home: new Scaffold(
        appBar: AppBar(
          title: Text("text wedgit example"),
          centerTitle: true,
          elevation: 6.0,//顶部bar阴影
//          backgroundColor: Color.fromARGB(0, 1, 1, 1),
        ),
        body: new Container(
//          color: Colors.black12,
          height: 300,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),//内边距
          margin: const EdgeInsets.all(10),//外边距
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.blue),
              gradient: const LinearGradient(
                  colors:[Colors.black12, Colors.black38, Colors.red])
          ),
//          alignment: Alignment.centerLeft,
          child: DefaultTextStyle(
            style: TextStyle(
                color: Colors.red,
                fontSize: 33
            ),
            textAlign: TextAlign.end,
            maxLines: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,//主轴对齐方式
              crossAxisAlignment: CrossAxisAlignment.start,//从轴对齐方式
              children: <Widget>[
                Text("Hello World"),
                Text(
                  "哈哈打不下独家卡了",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18
                  ),
                ),
                Text(
                  "Hello World, 曾经沧海难为水，除却巫山不是曾aa经沧海难为水，除却巫山不是曾经沧海难为水，除却巫山不是云",
                  textAlign: TextAlign.left,
//            textDirection: TextDirection.rtl,//同textAlign
                  textScaleFactor: 1,
//            softWrap: false,????
                  overflow: TextOverflow.ellipsis,//ellipsis, fade
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,//normal bold, w300
                    height: 1.5,//通过高度倍数设置行间距
//              backgroundColor:  Color.fromARGB(255, 0, 255, 255),//设置背景色，中英文混合时有问题
                    color: Color.fromARGB(222, 255, 0, 100),
                    letterSpacing: 3,//字符间距
//              wordSpacing: 0,//????
                    decoration: TextDecoration.underline,//lineThrough,underline
                    decorationColor: Color.fromARGB(222, 100, 0, 10),
                    decorationStyle: TextDecorationStyle.dotted,//dotted, dashed,double, solid, wavy
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}