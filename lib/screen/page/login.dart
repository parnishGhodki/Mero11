import 'package:cricketfantasy/screen/widget/slider.dart';
import 'package:cricketfantasy/services/authenticate.dart';
import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class LoginScreen extends StatefulWidget {
  bool isLoggedIn = false;
  FacebookAuthService facebookAuthService = FacebookAuthService();
  GoogleAuthService googleAuthService = GoogleAuthService();
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
            margin: EdgeInsets.only(top: 40),
            child: Text(appName,
                style: TextStyle(color: Colors.blue, fontSize: 30))),
        Image(alignment: Alignment.center, image: Image.asset(appIcon).image),
        SizedBox(height: 8),
        /*_socialLogin(EdgeInsets.all(10), LineIcons.facebook, '#4267B2',
            'Continue with Facebook', voidCallback: () async {
          //widget.isLoggedIn = await widget.facebookAuthService.signIn();
          //print(widget.isLoggedIn);
          widget.user = await widget.authentication.signInWithFacebook();
          print(widget.user.displayName);
        })*/
        _socialLogin(
            EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
            LineIcons.googlePlusSquare,
            '#EF5350',
            'Continue with Google', voidCallback: () async {
          //widget.isLoggedIn = await widget.googleAuthService.signIn();
          widget.user =
              await widget.authentication.signInWithGoogle(context: context);
          print(widget.user.displayName);
        })
      ]))),
    ]));
  }

  _socialLogin(
          EdgeInsets edgeInsets, IconData iconData, String color, String title,
          {VoidCallback voidCallback}) =>
      Container(
          margin: edgeInsets,
          decoration: new BoxDecoration(
            color: Colors.white70,
            borderRadius: new BorderRadius.circular(8.0),
          ),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                  borderRadius: new BorderRadius.circular(8.0),
                  onTap: () => voidCallback(),
                  child: Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Center(
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                            Icon(iconData, color: HexColor(color), size: 30),
                            SizedBox(width: 4),
                            Text(title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, color: HexColor(color)))
                          ]))))));
}
