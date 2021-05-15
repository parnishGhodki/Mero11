import 'package:cricketfantasy/model/userInfo.dart';
import 'package:cricketfantasy/screen/widget/signup.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final userInfo userinfo;
  SignUpScreen({this.userinfo});
  @override
  createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
          body: SafeArea(
              child: Stack(children: <Widget>[
        Container(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SignUpWidget(
                            userinfo: widget.userinfo,
                          )
                        ]))))
      ])))
    ]);
  }
}
