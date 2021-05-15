import 'package:cricketfantasy/model/contestHistory.dart';
import 'package:cricketfantasy/services/Transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ContestHistory contestHistory;

class HistoryDetailScreen extends StatefulWidget {
  final String userid;
  const HistoryDetailScreen({Key key, this.userid}) : super(key: key);
  @override
  createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetailScreen> {
  @override
  void initState() {
    super.initState();

    gethistorydetails().then((response) {
      setState(() {
        print(response);
        print(response.toString());
        contestHistory = response;
      });
    });
  }

  gethistorydetails() async {
    final History history = History();
    return await history.getWallet(widget.userid);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.all(0),
        physics: BouncingScrollPhysics(),
        children: contestHistory != null
            ? <Widget>[
                myProfile('Contests', contestHistory.data.contest.toString()),
                myProfile('Matches', contestHistory.data.matches.toString()),
                myProfile('Series', contestHistory.data.series.toString()),
                myProfile('Wins', contestHistory.data.wins.toString())
              ]
            : <Widget>[Text("Loading")]);
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
