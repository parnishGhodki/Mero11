import 'package:cricketfantasy/screen/page/payment/kyc_verification.dart';
import 'package:cricketfantasy/screen/widget/webview.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'contest_invite_code.dart';
import 'home.dart';
import 'package:cricketfantasy/util/extensions.dart';

class MoreScreen extends StatefulWidget {
  final VoidCallback inviteFriendClick;

  const MoreScreen({Key key, this.inviteFriendClick}) : super(key: key);
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  double _appBarHeight = 100.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      CustomScrollView(physics: BouncingScrollPhysics(), slivers: <Widget>[
        widget.sliverAppBar(
            _appBarBehavior, [], widget.flexibleSpaceBar('More')),
        SliverList(
            delegate: new SliverChildBuilderDelegate(
                (context, index) => Column(children: <Widget>[
                      InkWell(
                          onTap: () {
                            widget.inviteFriendClick();
                          },
                          child: moreItem('Invite Friends')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ContestInviteCodeScreen(),
                                    fullscreenDialog: true));
                          },
                          child: moreItem('Contest invite code')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        KYCVerificationScreen(),
                                    fullscreenDialog: true));
                          },
                          child: kyc()),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WebViewWidget(
                                        title: 'Point system',
                                        url: 'https://www.google.com/'),
                                    fullscreenDialog: true));
                          },
                          child: moreItem('Points system')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WebViewWidget(
                                        title: 'How to play',
                                        url: 'https://www.google.com/'),
                                    fullscreenDialog: true));
                          },
                          child: moreItem('How to play')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WebViewWidget(
                                        title: 'About us',
                                        url: 'https://www.google.com/'),
                                    fullscreenDialog: true));
                          },
                          child: moreItem('About us')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WebViewWidget(
                                        title: 'Legality',
                                        url: 'https://www.google.com/'),
                                    fullscreenDialog: true));
                          },
                          child: moreItem('Legality')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WebViewWidget(
                                        title: 'Terms and conditions',
                                        url: 'https://www.google.com/'),
                                    fullscreenDialog: true));
                          },
                          child: moreItem('Terms and conditions'))
                    ]),
                childCount: 1))
      ])
    ]));
  }

  moreItem(String title) => Container(
          child: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            child: Row(children: <Widget>[
              Expanded(child: Text(title)),
              Icon(LineIcons.arrowCircleRight)
            ])),
        Divider(height: 1)
      ]));

  kyc() => Container(
          child: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Row(children: <Widget>[
              Expanded(child: Text("KYC")),
              Container(
                  decoration: new BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: new BorderRadius.circular(20)),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 8.0, bottom: 8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                child: Text("Status:  ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey))),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.only(left: 4, right: 4),
                                      child: Text("Verified",
                                          style:
                                              TextStyle(color: Colors.green))),
                                  Icon(LineIcons.check,
                                      size: 18, color: Colors.green)
                                ])
                          ])))
            ])),
        Divider(height: 1)
      ]));
}
