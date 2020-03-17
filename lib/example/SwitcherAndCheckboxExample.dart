import 'package:flutter/material.dart';

void main() => runApp(MyApp(
    items: List.generate(100, (index) => "item $index")
));

class MyApp extends StatelessWidget{

  final List<String> items;

  MyApp({Key key, @required this.items}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "text wedgit",
      home: new Scaffold(
          appBar: AppBar(
            title: Text("Switch and Checkbox wedgit example"),
            centerTitle: true,
            elevation: 6.0,//顶部bar阴影
//          backgroundColor: Color.fromARGB(0, 1, 1, 1),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.red,),
                  activeIcon: Icon(Icons.home, color: Colors.red[700],),
                  title: Text(
                    "首页",
                  ),
                  backgroundColor: Colors.grey
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people, color: Colors.red,),
                  activeIcon: Icon(Icons.people, color: Colors.red[700],),
                  title: Text("我的"),
                  backgroundColor: Colors.grey
              )
            ],
          ),
          body: SwitcherAndCheckboxExample()
      ),
    );
  }
}

class SwitcherAndCheckboxExample extends StatefulWidget{
  @override
  SwitcherAndCheckboxState createState()=> SwitcherAndCheckboxState();
}

class SwitcherAndCheckboxState extends State<SwitcherAndCheckboxExample>{
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true;//维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,
          activeColor: Colors.red,//打开状态颜色
          activeTrackColor: Colors.blue,//打开状态背景颜色
          inactiveThumbColor:Colors.green,//关闭的圆圈颜色
          inactiveTrackColor: Colors.black,//关闭的背景颜色
          onChanged: (value){
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          checkColor: Colors.white,//对勾颜色
          activeColor:Colors.red,//背景颜色
          onChanged: (value){
            setState(() {
              _checkboxSelected = value;
            });
          },
        ),
      ],
    );
  }

}