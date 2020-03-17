import 'package:flutter/material.dart';
import 'index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
          title: "text wedgit",
          home: IndexPage()
      ),
    );
  }
}
