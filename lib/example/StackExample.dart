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
            title: Text("ListView wedgit example"),
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
          body:Center(
            child: Stack(
              alignment: FractionalOffset(0.5, 0.8),//位置
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage("https://sss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1583400416&di=f0ffa47eddf475779dd0e21c6a80a099&src=http://a0.att.hudong.com/78/52/01200000123847134434529793168.jpg"),
                  backgroundColor: Colors.red,
                  radius: 80,
                ),
                Text("哈哈",style: TextStyle(color: Colors.black, fontSize: 18),),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(Icons.delete),
                )
              ],
            ),
          )
      ),
    );
  }
}