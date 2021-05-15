class fixture {
  String status;
  String message;
  List<Data1> data1;

  fixture({this.status, this.message, this.data1});

  fixture.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data1 = new List<Data1>();
      json['data'].forEach((v) {
        data1.add(new Data1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data1 != null) {
      data['data'] = this.data1.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data1 {
  String matchId;
  String uniqueId;
  Null league;
  String date;
  String dateTimeGMT;
  String team1;
  String team2;
  String type;
  String squad;
  Null tossWinnerTeam;
  String matchStarted;
  String team1Image;
  String team2Image;
  int noOfContest;

  Data1(
      {this.matchId,
      this.uniqueId,
      this.league,
      this.date,
      this.dateTimeGMT,
      this.team1,
      this.team2,
      this.type,
      this.squad,
      this.tossWinnerTeam,
      this.matchStarted,
      this.team1Image,
      this.team2Image,
      this.noOfContest});

  Data1.fromJson(Map<String, dynamic> json) {
    matchId = json['match_id'];
    uniqueId = json['unique_id'];
    league = json['league'];
    date = json['date'];
    dateTimeGMT = json['dateTimeGMT'];
    team1 = json['team1'];
    team2 = json['team2'];
    type = json['type'];
    squad = json['squad'];
    tossWinnerTeam = json['toss_winner_team'];
    matchStarted = json['matchStarted'];
    team1Image = json['team1_image'];
    team2Image = json['team2_image'];
    noOfContest = json['no_of_contest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = new Map<String, dynamic>();
    data1['match_id'] = this.matchId;
    data1['unique_id'] = this.uniqueId;
    data1['league'] = this.league;
    data1['date'] = this.date;
    data1['dateTimeGMT'] = this.dateTimeGMT;
    data1['team1'] = this.team1;
    data1['team2'] = this.team2;
    data1['type'] = this.type;
    data1['squad'] = this.squad;
    data1['toss_winner_team'] = this.tossWinnerTeam;
    data1['matchStarted'] = this.matchStarted;
    data1['team1_image'] = this.team1Image;
    data1['team2_image'] = this.team2Image;
    data1['no_of_contest'] = this.noOfContest;
    return data1;
  }
}
