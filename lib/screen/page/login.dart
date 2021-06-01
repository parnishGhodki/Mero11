import 'package:cricketfantasy/services/authenticate.dart';
import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class LoginScreen extends StatefulWidget {
  Authentication authentication = Authentication();
  User user;
  @override
  createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Expanded(
          child: Container(
              child: Column(children: <Widget>[
        Container(
            child: Image(
              alignment: Alignment.center,
              image: Image.asset(appIcon).image,
            ),
            color: Colors.teal[400]),
        SizedBox(
          height: 18,
        ),
        Container(
          height: 40,
          width: 250,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              color: Colors.black,
              borderRadius: new BorderRadius.circular(20.0)),
          child: Text("Login with",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _socialLogin(
                EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                LineIcons.facebook,
                '#4267B2',
                'Facebook', voidCallback: () async {
              widget.user = await widget.authentication.signInWithFacebook();
            }),
            SizedBox(width: 4),
            _socialLogin(
                EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                LineIcons.googlePlusSquare,
                '#db3236',
                'Google', voidCallback: () async {
              widget.user = await widget.authentication
                  .signInWithGoogle(context: context);
            })
          ],
        ),
      ]))),
    ]));
  }

  _socialLogin(
          EdgeInsets edgeInsets, IconData iconData, String color, String title,
          {VoidCallback voidCallback}) =>
      Container(
          height: 40,
          width: 150,
          margin: edgeInsets,
          child: Material(
              borderRadius: new BorderRadius.circular(20.0),
              elevation: 2,
              color: HexColor(color),
              child: InkWell(
                  borderRadius: new BorderRadius.circular(20.0),
                  onTap: () => voidCallback(),
                  child: Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Center(
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                            Icon(iconData, color: Colors.white, size: 25),
                            SizedBox(width: 4),
                            Text(title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white))
                          ]))))));
}
