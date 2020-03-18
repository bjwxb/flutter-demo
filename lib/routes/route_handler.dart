import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:myapp/example/TextFieldExample.dart';

//文本输入框练习
var textFieldExHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new TextFieldExample();
  }
);