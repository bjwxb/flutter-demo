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
          body:Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  alignment: FractionalOffset(0.5, 0.8),//位置//AlignmentDirectional.center
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage("https://sss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1583400416&di=f0ffa47eddf475779dd0e21c6a80a099&src=http://a0.att.hudong.com/78/52/01200000123847134434529793168.jpg"),
                      backgroundColor: Colors.red,
                      radius: 100,
                    ),
                    Text("哈哈",style: TextStyle(color: Colors.black, fontSize: 18),),
                    Positioned(
                      child: Icon(Icons.person_pin),
                      right: 0,
                      top: 0,
                    )
                  ],
                ),
                Wrap(
                  spacing: 8.0, // 主轴(水平)方向间距
                  runSpacing: 4.0, // 纵轴（垂直）方向间距
                  alignment: WrapAlignment.start, //沿主轴方向居中
                  children: <Widget>[
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                      label: new Text('Hamilton'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
                      label: new Text('Lafayette'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
                      label: new Text('Mulligan'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                      label: new Text('Laurens'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                      label: new Text('java'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                      label: new Text('ja'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                      label: new Text('hi'),
                    ),
                    //Flex的两个子widget按1：2来占据水平空间
                    Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 50.0,
                            color: Colors.red,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 30.0,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        height: 100.0,
                        //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
                        child: Flex(
                          direction: Axis.vertical,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                color: Colors.red,
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],

            ),
          )
      ),
    );
  }
}