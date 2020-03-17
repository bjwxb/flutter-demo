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
          body: InfiniteGridView()
      ),
    );
  }
}

//当子widget比较多时，通过GridView.builder来动态创建子widget
class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => new _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {

  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //每行三列
            childAspectRatio: 1.0 //显示区域宽高相等
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          //如果显示到最后一个并且Icon总数小于200时继续获取数据
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        }
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}