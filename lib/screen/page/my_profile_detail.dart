import 'package:cricketfantasy/model/userInfo.dart';
import 'package:cricketfantasy/screen/page/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MyProfileDetailScreen extends StatefulWidget {
  final userInfo userdata;
  const MyProfileDetailScreen({Key key, this.userdata}) : super(key: key);
  @override
  createState() => _MyProfileDetailState();
}

class _MyProfileDetailState extends State<MyProfileDetailScreen> {
  @override
  void initState() {
    print(widget.userdata.data.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignUpScreen(
                            userinfo: widget.userdata,
                          )));
            },
            child: Icon(LineIcons.edit)),
        body: ListView(
            padding: EdgeInsets.all(0),
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              widget.userdata.data.email == null
                  ? myProfile('Name', "NA")
                  : myProfile('Name', widget.userdata.data.name),
              widget.userdata.data.email == null
                  ? myProfile('Email', "NA")
                  : myProfile('Email', widget.userdata.data.email),
              widget.userdata.data.mobileNo == null
                  ? myProfile('Mobile', "NA")
                  : myProfile('Mobile', widget.userdata.data.mobileNo),
              widget.userdata.data.dob == null
                  ? myProfile('Birth Date', "NA")
                  : myProfile('Birth Date', widget.userdata.data.dob),
              widget.userdata.data.gender == null
                  ? myProfile('Gender', "NA")
                  : myProfile('Gender', widget.userdata.data.gender),
              widget.userdata.data.country == null
                  ? myProfile('Country', "NA")
                  : myProfile('Country', widget.userdata.data.country),
              widget.userdata.data.state == null
                  ? myProfile('State', "NA")
                  : myProfile('State', widget.userdata.data.state),
              widget.userdata.data.city == null
                  ? myProfile('City', "NA")
                  : myProfile('City', widget.userdata.data.city),
            ]));
  }

  myProfile(String title, String response) => Column(children: <Widget>[
        Container(
            padding: EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child:
                          Text(title, style: TextStyle(color: Colors.black54))),
                  Container(child: Text(response))
                ])),
        Divider()
      ]);
}
