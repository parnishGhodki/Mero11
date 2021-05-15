import 'package:cricketfantasy/model/userInfo.dart';
import 'package:cricketfantasy/screen/widget/button_animation.dart';
import 'package:cricketfantasy/screen/widget/otp_timer.dart';
import 'package:cricketfantasy/services/authenticate.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen({this.phone});

  @override
  createState() => _OTPState();
}

class _OTPState extends State<OTPScreen> with TickerProviderStateMixin {
  // final AuthService _auth = AuthService();
  AnimationController _animationController;
  var otpText = '';
  var isTimerFinish = false;
  var otpTimerView = false;
  var otpController = new TextEditingController();
  var verificationId;

  @override
  void initState() {
    print("0000000000000000000000000000000000000000000000000000");
    //final AuthService _auth = AuthService();
    //verificationId = _auth.signIn(widget.phone);
    _animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 400));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
          body: Stack(children: <Widget>[
        SafeArea(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                    margin: EdgeInsets.all(10),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        maxHeight: MediaQuery.of(context).size.height),
                    child: Column(children: <Widget>[
                      Text(appName, style: TextStyle(fontSize: 18)),
                      SizedBox(height: 20),
                      Text(
                        'Sit back and relax, while we are verifying your number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 30),
                      OtpTimerWidget(timeCallBack: (isFinish) {
                        if (isFinish) {
                          if (!mounted) return;
                          setState(() {
                            isTimerFinish = true;
                            _animationController.forward();
                          });
                        }
                      }),
                      Container(
                          width: 150,
                          child: TextField(
                              controller: otpController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              autofocus: true,
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.teal)),
                                  counterStyle:
                                      TextStyle(color: Colors.transparent)),
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              onChanged: (onChange) {
                                otpText = onChange;
                                if (!isTimerFinish) {
                                  if (onChange.length == 6) {
                                    _animationController.forward();
                                  } else {
                                    _animationController.reverse();
                                  }
                                }
                              }))
                    ])))),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(children: <Widget>[
              new SizeTransition(
                  sizeFactor: new CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.fastOutSlowIn),
                  axis: Axis.horizontal,
                  child: ButtonAnimationWidget(
                    name: isTimerFinish ? 'Resend' : 'Next',
                    callBack: () {
                      print(verificationId.toString());
                      //_auth.otpRegistration(otpText, verificationId.toString());
                      otpController.clear();
                      //_auth.signInAnon();

                      //Navigator.pushNamed(context, routeSignUp);
                      /*_animationController.reverse().then((t) {
                        setState(() {
                          isTimerFinish = false;
                          otpTimerView = !otpTimerView;
                        });
                      });*/
                    },
                  ))
            ]))
      ]))
    ]);
  }
}
