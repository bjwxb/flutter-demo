import 'package:flutter/material.dart';
import 'pager/health_page.dart';
import 'pager/home_page.dart';
import 'pager/medical_page.dart';
import 'pager/mine_page.dart';

//首页，包含四个tab页面
class IndexPage extends StatefulWidget{

  @override
  _IndexPageState createState()=> _IndexPageState();
}

class _IndexPageState extends State<IndexPage>{
  final List<BottomNavigationBarItem> bottomTabList = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("首页")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.queue_play_next),
        title: Text("服药")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.healing),
        title: Text("健康")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text("我的")
    )
  ];
  final List bodyList = [
    HomePage(),
    MedicalPage(),
    HealthPage(),
    MinePage()
  ];

  int currentPageIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = bodyList[currentPageIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "心之力",
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("心之力", style: TextStyle(color: Colors.red),),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentPageIndex,
          items: bottomTabList,
          onTap: (index){
            setState(() {
              currentPageIndex = index;
              currentPage = bodyList[index];
            });
          },
        ),
        body: currentPage,
      ),
    );
  }
}
