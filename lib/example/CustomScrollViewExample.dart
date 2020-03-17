import 'package:flutter/cupertino.dart';
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
//          appBar: AppBar(
//            title: Text("ListView wedgit example"),
//            centerTitle: true,
//            elevation: 6.0,//顶部bar阴影
////          backgroundColor: Color.fromARGB(0, 1, 1, 1),
//          ),
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
          body: Material(
            child: CustomScrollView(
//              scrollDirection: Axis.horizontal,//滑动方向
              slivers: <Widget>[
                //AppBar，包含一个导航栏
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 160.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text('Demo'),
                    background: Image.asset(
                      "images/teach.png", fit: BoxFit.cover,),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: new SliverGrid( //Grid
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //Grid按两列显示
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 4.0,
                    ),
                    delegate: new SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        //创建子widget
                        return new Container(
                          alignment: Alignment.center,
                          color: Colors.cyan[100 * (index % 9)],
                          child: new Text('grid item $index'),
                        );
                      },
                      childCount: 8,
                    ),
                  ),
                ),
                //List
                SliverFixedExtentList(
                  itemExtent: 50.0,
                  delegate: new SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        //创建列表项
                        return new Container(
                          alignment: Alignment.center,
                          color: Colors.lightBlue[100 * (index % 9)],
                          child: new Text('list item $index'),
                        );
                      },
                      childCount: 50 //50个列表项
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
