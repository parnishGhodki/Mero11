import 'package:cricketfantasy/screen/page/home.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';

extension ContextExtensions on BuildContext {
  double widthInPercent(double percent) {
    var toDouble = percent / 100;
    return MediaQuery.of(this).size.width * toDouble;
  }

  double heightInPercent(BuildContext context, double percent) {
    var toDouble = percent / 100;
    return MediaQuery.of(this).size.height * toDouble;
  }

  showProgress(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Container(
              alignment: FractionalOffset.center,
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(colorProgressBar)),
            ));
  }

  void hideProgress(BuildContext context) {
    Navigator.pop(context);
  }
}

extension WidgetExtensions on Widget {
  inputField(TextEditingController textEditingController,
          {ValueChanged<String> onChanged,
          int maxLength,
          TextInputType keyboardType,
          String hintText,
          String labelText,
          bool obscureText = false,
          InkWell inkWell,
          FormFieldValidator<String> validation}) =>
      TextFormField(
          controller: textEditingController,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLength: maxLength,
          onChanged: onChanged,
          decoration: InputDecoration(
              hintText: hintText,
              counterText: '',
              labelText: labelText,
              suffix: inkWell),
          validator: validation);

  padding(EdgeInsets edgeInsets) => Padding(padding: edgeInsets, child: this);

  cardView(EdgeInsets margin, EdgeInsets padding) => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0, // has the effect of softening the shadow
                spreadRadius: 0.5, // has the effect of extending the shadow
                offset: Offset(
                    0, // horizontal, move right 10
                    0 // vertical, move down 10
                    ))
          ]),
      child: this,
      margin: margin,
      padding: padding);

  marginVisible({EdgeInsets edgeInsets, bool isVisible = true}) => Visibility(
      visible: isVisible,
      child: Container(
          margin: (edgeInsets == null) ? EdgeInsets.all(0) : edgeInsets,
          child: this));

  circleAvatar({double radius, Color color}) =>
      CircleAvatar(radius: radius, backgroundColor: color, child: this);

  roundCircleButton(
          IconData iconData, bool isMini, VoidCallback voidCallback) =>
      FloatingActionButton(
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          mini: isMini,
          onPressed: voidCallback,
          child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradientsButton)),
              child: Stack(fit: StackFit.expand, children: <Widget>[
                Icon(iconData, size: 30, color: Colors.black)
              ])));

  customFloatForm(
          {IconData icon, VoidCallback qrCallback, bool isMini = false}) =>
      FloatingActionButton(
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          mini: isMini,
          onPressed: qrCallback,
          child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradientsButton)),
              child: Stack(fit: StackFit.expand, children: <Widget>[
                Icon(icon, size: 30, color: Colors.blue)
              ])));

  sliverAppBar(AppBarBehavior appBarBehavior, List<Widget> actions,
          Widget flexibleSpace) =>
      SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 55.0,
          pinned: appBarBehavior == AppBarBehavior.pinned,
          floating: appBarBehavior == AppBarBehavior.floating ||
              appBarBehavior == AppBarBehavior.snapping,
          snap: appBarBehavior == AppBarBehavior.snapping,
          primary: true,
          centerTitle: false,
          actions: actions,
          flexibleSpace: flexibleSpace,
          elevation: 1);

  flexibleSpaceBar(String title) => FlexibleSpaceBar(
      centerTitle: false,
      titlePadding: EdgeInsetsDirectional.only(start: 12, bottom: 12),
      title: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Image(
          height: 50,
          width: 50,
          image: Image.asset(appIcon).image,
        ),
        Text(title, style: TextStyle(fontSize: 22))
      ]));

  drawerIcon(Function callBack) => GestureDetector(
      onTap: () => callBack(),
      child: Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.only(top: 3, bottom: 3),
          child: Icon(SimpleLineIcons.menu, size: 18)));

  notificationIcon(Function callBack) => GestureDetector(
      onTap: () => callBack(),
      child: Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.only(top: 3, bottom: 3),
          child: Icon(SimpleLineIcons.bell, size: 18)));

  drawerMenu({IconData icon, String title, VoidCallback qrCallback}) => InkWell(
      onTap: qrCallback,
      child: Padding(
          padding: EdgeInsets.all(14),
          child: new Row(children: <Widget>[
            Icon(icon, size: 22),
            SizedBox(width: 30),
            Text(title)
          ])));
}
