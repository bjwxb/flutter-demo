import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(TextFieldExample());

class TextFieldExample extends StatefulWidget {
  @override
  _FormTestRouteState createState() => new _FormTestRouteState();
}

class _FormTestRouteState extends State<TextFieldExample> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("TextFormField Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidate: false, //是否开启自动校验
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  TextFormField(
                      autofocus: true,
                      controller: _nameController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        //RegExp("[a-z,A-Z,0-9]")//限制只允许输入字母和数字
                        WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        //WhitelistingTextInputFormatter.digitsOnly//限制只允许输入数字
                        LengthLimitingTextInputFormatter(11),//限制输入长度不超过11位
                      ],
                      autovalidate: true,//是否开启自动校验
                      decoration: InputDecoration(
//                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
//                      labelText: "用户名",
                          hintText: "请输入手机号",
                          icon: Icon(Icons.person),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.close,
                            ),
                            onPressed: (){
                              //解决点击事件报异常
                              WidgetsBinding.instance.addPostFrameCallback((_) => _nameController.clear());
                            },
                          )
                      ),
                      // 校验用户名
                      validator: (v) {
                        return v.trim().length > 0 ? null : "手机号不能为空";
                      }

                  ),
                  TextFormField(
                      controller: _pwdController,
                      decoration: InputDecoration(
//                      labelText: "密码",
                          hintText: "请输入密码",
                          icon: Icon(Icons.lock)
                      ),
                      inputFormatters: [
                        //RegExp("[a-z,A-Z,0-9]")//限制只允许输入字母和数字
                        WhitelistingTextInputFormatter(RegExp("[a-z,A-Z,0-9]")),
                        //WhitelistingTextInputFormatter.digitsOnly//限制只允许输入数字
                        LengthLimitingTextInputFormatter(16),
                      ],
                      obscureText: true,
                      //校验密码
                      validator: (v) {
                        return v
                            .trim()
                            .length > 5 ? null : "密码不能少于6位";
                      }
                  ),
                  // 登录按钮
                  Container(
                    width: double.infinity,
//                    margin: EdgeInsets.only(left: 15, right: 15),
                    padding: const EdgeInsets.only(top: 30),
                    child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      child: Text("登录"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      onPressed: () {
                        //在这里不能通过此方式获取FormState，context不对
                        //print(Form.of(context));

                        // 通过_formKey.currentState 获取FormState后，
                        // 调用validate()方法校验用户名密码是否合法，校验
                        // 通过后再提交数据。
                        if((_formKey.currentState as FormState).validate()){
                          //验证通过提交数据
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}