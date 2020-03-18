import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:myapp/routes/Application.dart';
import 'routes/routes.dart';
import 'routes/route_handler.dart';
import 'index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  MyApp(){
    final router = new Router();
    Routes.configureRoute(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
          title: "text wedgit",
          home: IndexPage(),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
