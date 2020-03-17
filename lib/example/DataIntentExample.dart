import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'buttonExample.dart';

void main() => runApp(MyApp(productList: List.generate(30, (index) => Product("item $index", "item description $index"))));

class Product{
  final String name;
  final String description;
  Product(this.name, this.description);
}

class MyApp extends StatelessWidget{

  final List<Product> productList;

  const MyApp({Key key, this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "text wedgit",
      home: new Scaffold(
        appBar: AppBar(
          title: Text("数据传递和接受", style: TextStyle(color: Colors.red),),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
              print("+++++++++++++++++");
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
        body: Container(
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
            child:ProductList(productList: productList)
        ),
      ),
    );
  }
}
class ProductList extends StatelessWidget{

  final List<Product> productList;

  const ProductList({Key key, this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index){
          return Container(
            margin: const EdgeInsets.all(10),//外边距
            child: ListTile(
              title: Text(productList[index].name),
              onTap: (){//list item click listener
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ButtonAppTest()
                ));
              },
            ),
          );
        });
  }

}