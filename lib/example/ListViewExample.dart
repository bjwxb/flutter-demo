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
          body: new ListView.separated(//builder :普通列表,separated: 可加分割线
              scrollDirection: Axis.vertical,
              itemCount: items.length,
//              padding: const EdgeInsets.all(8),
              separatorBuilder: (context, index){
                return Padding(//设置内边距
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(color: Colors.red),
                );
              },
              itemBuilder: (context, index){
                return new Container(
//                  width: 100,
//                  height: 60,
                  child: ListTile(
                    title:  Padding(padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      child: Text(items[index], style: TextStyle(color: Colors.red),),
                    ),
                  ),
                );
              })
      ),
    );
  }
}