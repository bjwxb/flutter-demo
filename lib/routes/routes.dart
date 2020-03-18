import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import "route_handler.dart";


class Routes{
  static String root = "/";
  static String textFieldEx = "/ex/textField";

  static void configureRoute(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params){
        print("route is not find ~~");
      }
    );

    router.define(textFieldEx, handler: textFieldExHandler);
  }
}
