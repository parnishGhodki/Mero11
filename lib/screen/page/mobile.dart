import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:cricketfantasy/model/userInfo.dart';
import 'package:cricketfantasy/screen/page/otp.dart';
import 'package:cricketfantasy/screen/widget/button_animation.dart';
import 'package:cricketfantasy/services/authenticate.dart';
import 'package:cricketfantasy/services/authenticate.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MobileScreen extends StatefulWidget {
  //FacebookAuthService authService = FacebookAuthService();
  @override
  createState() => _MobileState();
}

class _MobileState extends State<MobileScreen> with TickerProviderStateMixin {
  String countryCode;
  AnimationController _animationController;

  var selectedCountryCode = '91';
  Country _selectedCountry = CountryPickerUtils.getCountryByIsoCode('in');

  var _mobileController = new TextEditingController(); /////input mobile number
  //var _mobileFocusNode = FocusNode();

  @override
  void initState() {
    _animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 400));

    super.initState();
  }

  @override
  void dispose() {
    //_mobileFocusNode.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(children: <Widget>[
            new SizeTransition(
                sizeFactor: new CurvedAnimation(
                    parent: _animationController, curve: Curves.fastOutSlowIn),
                axis: Axis.horizontal,
                child: ButtonAnimationWidget(
                    name: 'Continue',
                    callBack: () {
                      //widget.authService.signIn();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPScreen(
                                    phone: "+91" + _mobileController.text,
                                  )));
                    }))
          ])),
      SafeArea(
          child: Container(
              margin: EdgeInsets.all(10),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                  maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _help(),
                    SizedBox(height: 10),
                    Text('Please enter your 10-digit \nmobile number.',
                        style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Container(
                        margin: EdgeInsets.all(10), child: _mobileInput()),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'By continue, you are agree to our ',
                              style: TextStyle(
                                  color: Colors.black, fontFamily: quickFont)),
                          TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(
                                  color: Colors.blue, fontFamily: quickFont),
                              recognizer: new TapGestureRecognizer()
                                ..onTap =
                                    () async {}), /////////////////Terms and conditions
                          TextSpan(
                              text: '\n & ',
                              style: TextStyle(
                                  color: Colors.blue, fontFamily: quickFont)),
                          TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(color: Colors.blue),
                              recognizer: new TapGestureRecognizer()
                                ..onTap =
                                    () async {}), //////////////////terms and conditions
                          TextSpan(
                              text: '.',
                              style: TextStyle(
                                  color: Colors.black, fontFamily: quickFont))
                        ]))
                  ])))
    ]));
  }

  _help() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(SimpleLineIcons.question,
              size: 16, color: Colors.blue.withOpacity(0.8)),
          SizedBox(width: 4),
          Text('Help',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
        ]);
  }

  _mobileInput() {
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
      InkWell(
          child: _selectCountry(_selectedCountry), onTap: _countryPickerDialog),
      Flexible(
          child: Container(
              margin: EdgeInsets.only(left: 16),
              child: TextField(
                  controller: _mobileController,
                  //autofocus: true,
                  //focusNode: _mobileFocusNode,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: 'Mobile Number',
                      prefix: Text("+${_selectedCountry.phoneCode} ")),
                  onChanged: (onChanged) {
                    if (onChanged.length > 4) {
                      _animationController.forward();
                    } else {
                      _animationController.reverse();
                    }
                  })))
    ]);
  }

  _selectCountry(Country country) {
    return Row(
        children: <Widget>[CountryPickerUtils.getDefaultFlagImage(country)]);
  }

  void _countryPickerDialog() => showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CountryPickerCupertino(
            itemBuilder: _countryItem,
            pickerSheetHeight: 250.0,
            pickerItemHeight: 60,
            initialCountry: _selectedCountry,
            onValuePicked: (Country country) {
              selectedCountryCode = _selectedCountry.phoneCode;
              setState(() => _selectedCountry = country);
            });
      });

  Widget _countryItem(Country country) => Container(
      margin: EdgeInsets.only(left: 32, right: 32),
      child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(width: 8.0),
        Expanded(
            child: Text(country.name,
                maxLines: 3,
                style: TextStyle(fontSize: 16, fontFamily: quickFont))),
        Text("+${country.phoneCode}",
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 15, fontFamily: quickFont))
      ]));
}
