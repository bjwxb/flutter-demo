import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:myapp/example/TextFieldExample.dart';
import 'package:myapp/widget/bobble/bobble_widget.dart';

//文本输入框练习
var textFieldExHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new TextFieldExample();
});

var bobbleHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BobbleWidget();
});
