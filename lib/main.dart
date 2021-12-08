import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/mvvm/routes/app_pages.dart';
import 'package:myapp/mvvm/routes/app_route.dart';
import 'package:myapp/routes/Application.dart';

import 'index.dart';
import 'mvvm/page/unknown/unknown.dart';
import 'mvvm/themes/app_theme.dart';
import 'routes/routes.dart';

void main() {
  runApp(GetXApp());
}

class GetXApp extends StatelessWidget {
  const GetXApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      unknownRoute: GetPage(name: AppRoutes.unknownRote, page: () => UnknownPage()), //跳转路由未定义时，跳转到此页面
      title: "getX example", //应用程序描述
      initialRoute: AppRoutes.root, //默认打开的路由页面
      getPages: AppPages.list, //路由表配置 - list
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft, //路由过渡效果， 枚举值
      routingCallback: (route) {
        //路由监听回调函数
        print(">>> ${route.current}");
      },
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      // home: Spla,//可配置启动页
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new FluroRouter();
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
