import 'package:flutter/material.dart';

void main() => runApp(MyApp(
    items: List.generate(100, (index) => "item $index")
));

class MyApp extends StatelessWidget{

  final List<String> items;

  MyApp({Key key, @required this.items}):super(key:key);

  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
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
          body: Scrollbar(
            child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    //动态创建一个List<Widget>
                    children: str.split("")
                    //每一个字母都用一个Text显示,字体为原来的两倍
                        .map((c) => Text(c, textScaleFactor: 2.0,))
                        .toList(),
                  ),
                )
            ),
          )
      ),
    );
  }
}
