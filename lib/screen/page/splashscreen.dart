import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SplashScreen extends StatefulWidget {
  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    _navigation();

    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    animationController.forward();
    super.initState();
  }

  void _navigation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    Navigator.pushReplacementNamed(context, routeLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
          decoration: BoxDecoration(color: Colors.blue),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                new Text(appName,
                    style: new TextStyle(fontSize: 30.0, color: Colors.white),
                    textAlign: TextAlign.center),
                SizeTransition(
                    sizeFactor: new CurvedAnimation(
                        parent: animationController,
                        curve: Curves.fastOutSlowIn),
                    axis: Axis.vertical,
                    child: Container(height: 20.0)),
                CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
              ])))
    ]));
  }
}

/*
class ToastMessageAnimation extends StatelessWidget {
  final Widget child;

  ToastMessageAnimation(this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("translateY")
          .add(
            Duration(milliseconds: 250),
            Tween(begin: -100.0, end: 0.0),
            curve: Curves.easeOut,
          )
          .add(Duration(seconds: 1, milliseconds: 250),
              Tween(begin: 0.0, end: 0.0))
          .add(Duration(milliseconds: 250), Tween(begin: 0.0, end: -10.0),
              curve: Curves.easeIn),
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0))
          .add(Duration(seconds: 1), Tween(begin: 1.0, end: 1.0))
          .add(Duration(milliseconds: 500), Tween(begin: 1.0, end: 0.0)),
    ]);

    return ControlledAnimation(
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}
*/
