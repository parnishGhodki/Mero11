import 'package:flutter/material.dart';

class ButtonAnimationWidget extends StatelessWidget {
  final void Function() callBack;
  final String name;

  const ButtonAnimationWidget({Key key, this.callBack, this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.blue,
        child: InkWell(
            highlightColor: Colors.blue.withOpacity(0.8),
            onTap: () => callBack(),
            child: Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Center(
                    child: Text(name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))))));
  }
}
