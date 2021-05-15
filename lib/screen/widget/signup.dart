import 'package:cricketfantasy/model/state_response.dart';
import 'package:cricketfantasy/model/userInfo.dart';
import 'package:cricketfantasy/screen/page/tab.dart';
import 'package:cricketfantasy/screen/widget/button_animation.dart';
import 'package:cricketfantasy/services/updateProfile.dart';
import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

const double _kPickerSheetHeight = 216.0;

class SignUpWidget extends StatefulWidget {
  final userInfo userinfo;
  final void Function() callBack;

  SignUpWidget({Key key, this.callBack, this.userinfo}) : super(key: key);
  @override
  createState() => _SignUpState();
}

class _SignUpState extends State<SignUpWidget> {
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var referCodeController = TextEditingController();
  var phoneController = TextEditingController();

  var date = DateTime.now();

  var _selectedStateIndex = 0;
  List<StateResponse> _stateList = new List();

  var _selectedCityIndex = 0;
  List<CityResponse> _cityList = new List();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _stateList
        .add(StateResponse(name: 'Gujarat', countryId: '91', stateId: '1'));
    _cityList
        .add(CityResponse(name: 'Kathmandu', countryId: '91', cityId: '1'));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          margin: EdgeInsets.all(16.0),
          child: Stack(children: <Widget>[
            Container(
                height: 96,
                width: 96,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0)
                    ]),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(48.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Container(
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 48,
                                      child: Container(
                                          padding: EdgeInsets.all(0.0),
                                          child: Image.asset(profileImage,
                                              fit: BoxFit.cover))))))
                    ])),
            Positioned(
                left: 60.0,
                top: 60.0,
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.transparent),
                    height: 35,
                    width: 35,
                    child: GestureDetector(
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          child: Icon(Icons.edit, color: Colors.white),
                        ),
                        onTap: () {})))
          ])),
      Form(
          key: _formKey,
          child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(16.0),
                child: Column(children: <Widget>[
                  /*TextFormField(
                      controller: userNameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          icon: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Icon(LineIcons.user),
                          )),
                      onEditingComplete: () {},
                      onSaved: (value) {}),*/
                  Text(widget.userinfo.data.name),
                  SizedBox(height: 8),
                  widget.userinfo.data.email == null
                      ? TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              icon: Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: Icon(LineIcons.googleLogo),
                              )),
                          onEditingComplete: () {},
                          onSaved: (value) {})
                      : Text(widget.userinfo.data.email),
                  SizedBox(height: 8),
                  _datePicker(context),
                  SizedBox(height: 10),
                  _genderPicker(context),
                  SizedBox(height: 10),
                  _statePicker(context),
                  SizedBox(height: 8),
                  _cityPicker(context),
                  SizedBox(height: 8),
                  /*TextFormField(
                      controller: referCodeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Refer Code',
                          icon: Padding(
                              padding: const EdgeInsets.only(top: 14),
                              child: Icon(Icons.receipt))),
                      onEditingComplete: () {},
                      onSaved: (value) {}),
                  SizedBox(height: 8),*/
                  TextFormField(
                    controller: phoneController,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        icon: Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: Icon(LineIcons.mobilePhone))),
                  ),
                  SizedBox(height: 8),
                ])),
            ButtonAnimationWidget(
                name: 'Register',
                callBack: () async {
                  /*userInfo finaluserinfo = userInfo();
                  finaluserinfo.data.userId = userinfo.data.userId;
                  finaluserinfo.data.email = userinfo.data.email;
                  finaluserinfo.data.mobileNo = phoneController.text;
                  finaluserinfo.data.name = userinfo.data.name;
                  finaluserinfo.data.dob = date.toString();
                  finaluserinfo.data.gender = genderList[genderListIndex];
                  finaluserinfo.data.country = "Nepal";
                  finaluserinfo.data.state =
                      _stateList[_selectedStateIndex].name;
                  finaluserinfo.data.city = _cityList[_selectedCityIndex].name;

                  print(finaluserinfo.data.toString());*/

                  UpdateProfile updateProfile = UpdateProfile();
                  String success = await updateProfile.update(
                      userinfo.data.userId,
                      userinfo.data.name,
                      phoneController.text,
                      userinfo.data.email,
                      date.toString(),
                      genderList[genderListIndex],
                      "Nepal",
                      _stateList[_selectedStateIndex].name,
                      _cityList[_selectedCityIndex].name);

                  final status = Provider.of<User>(context, listen: false);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TabScreen(
                                user: status,
                                index: 2,
                              )));
                })
          ]))
    ]);
  }

  _datePicker(BuildContext context) {
    return Container(
        child: InkWell(
            onTap: () {
              showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomPicker(CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (DateTime dateTime) {
                          setState(() => date = dateTime);
                        }));
                  });
            },
            child: Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 14, left: 4),
                  child: Icon(LineIcons.calendarTimes,
                      color: HexColor('#8C8C8C'), size: 20)),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text('Date of Birth')),
                            DateFormat.yMd().format(date) !=
                                    DateFormat.yMd().format(DateTime.now())
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(DateFormat.yMd().format(date) !=
                                            DateFormat.yMd()
                                                .format(DateTime.now())
                                        ? DateFormat.yMMMMd().format(date)
                                        : ''))
                                : SizedBox(
                                    width: 0,
                                    height: 8,
                                  ),
                            Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Container(
                                    height: 1.2, color: HexColor('#8C8C8C')))
                          ])))
            ])));
  }

  _statePicker(BuildContext context) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(initialItem: _selectedStateIndex);
    return Container(
        child: InkWell(
            onTap: () async {
              if (_stateList.length < 1) {
              } else {
                await showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return _buildBottomPicker(CupertinoPicker(
                        scrollController: scrollController,
                        itemExtent: 44,
                        backgroundColor: CupertinoColors.white,
                        onSelectedItemChanged: (int index) {
                          setState(() => _selectedStateIndex = index);
                        },
                        children: List<Widget>.generate(_stateList.length,
                            (int index) {
                          return Center(child: Text(_stateList[index].name));
                        }),
                      ));
                    }).then((t) {});
              }
            },
            child: Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Icon(LineIcons.map,
                      color: HexColor('#8C8C8C'), size: 24)),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('State')),
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child:
                                    Text(_stateList[_selectedStateIndex].name)),
                            Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Container(
                                    height: 1.2, color: HexColor('#8C8C8C')))
                          ])))
            ])));
  }

  _cityPicker(BuildContext context) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(initialItem: _selectedStateIndex);
    return Container(
        child: InkWell(
            onTap: () async {
              if (_stateList.length < 1) {
              } else {
                await showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return _buildBottomPicker(CupertinoPicker(
                        scrollController: scrollController,
                        itemExtent: 44,
                        backgroundColor: CupertinoColors.white,
                        onSelectedItemChanged: (int index) {
                          setState(() => _selectedCityIndex = index);
                        },
                        children: List<Widget>.generate(_cityList.length,
                            (int index) {
                          return Center(child: Text(_cityList[index].name));
                        }),
                      ));
                    }).then((t) {});
              }
            },
            child: Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Icon(LineIcons.map,
                      color: HexColor('#8C8C8C'), size: 24)),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('City')),
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child:
                                    Text(_cityList[_selectedCityIndex].name)),
                            Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Container(
                                    height: 1.2, color: HexColor('#8C8C8C')))
                          ])))
            ])));
  }

  var genderList = ['male', 'female', 'other'];
  var selectedGender = 'male';
  var genderListIndex = 0;

  _genderPicker(BuildContext context) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(initialItem: genderListIndex);
    return Container(
        child: InkWell(
            onTap: () async {
              await showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomPicker(CupertinoPicker(
                      scrollController: scrollController,
                      itemExtent: 44,
                      backgroundColor: CupertinoColors.white,
                      onSelectedItemChanged: (int index) {
                        setState(() => genderListIndex = index);
                      },
                      children:
                          List<Widget>.generate(genderList.length, (int index) {
                        return Center(
                          child: Text(genderList[index][0].toUpperCase() +
                              genderList[index].substring(1).toLowerCase()),
                        );
                      }),
                    ));
                  }).then((t) {
                selectedGender = genderList[genderListIndex];
              });
            },
            child: Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Icon(LineIcons.male,
                      color: HexColor('#8C8C8C'), size: 24)),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('Gender')),
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(genderList[genderListIndex][0]
                                        .toUpperCase() +
                                    genderList[genderListIndex]
                                        .substring(1)
                                        .toLowerCase())),
                            Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Container(
                                    height: 1.2, color: HexColor('#8C8C8C')))
                          ])))
            ])));
  }

  _buildBottomPicker(Widget picker) {
    return Container(
        height: _kPickerSheetHeight,
        padding: const EdgeInsets.only(top: 6.0),
        color: CupertinoColors.white,
        child: DefaultTextStyle(
            style:
                const TextStyle(color: CupertinoColors.black, fontSize: 22.0),
            child: GestureDetector(
                // Blocks taps from propagating to the modal sheet and popping.
                onTap: () {},
                child: SafeArea(top: false, child: picker))));
  }

  void _submit() async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (_formKey.currentState.validate() == false) {
      return;
    }
    if (DateTime.now().difference(date).inDays < 6570) {
      return;
    }
  }
}
