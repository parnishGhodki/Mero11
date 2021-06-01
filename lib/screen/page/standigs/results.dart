import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import '../../widget/team_play.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Text("");
              /*TeamPlayWidget(
                  matchStatus: 'Match status',
                  seriesName: 'Series name',
                  teamNameA: 'Team A',
                  teamNameB: 'Team B',
                  countryImageA: profileImage,
                  countryImageB: profileImage,
                  contestJoinShow: true,
                  noOfContests: 1);*/
            }));
  }
}
