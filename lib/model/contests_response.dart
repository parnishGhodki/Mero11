class ContestInfo {
  String status;
  String message;
  Data data;

  ContestInfo({this.status, this.message, this.data});

  ContestInfo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String matchId;
  String uniqueId;
  String team1;
  String team2;
  String date;
  String dateTimeGMT;
  String team1Image;
  String team2Image;
  List<Contests> contests;

  Data(
      {this.matchId,
      this.uniqueId,
      this.team1,
      this.team2,
      this.date,
      this.dateTimeGMT,
      this.team1Image,
      this.team2Image,
      this.contests});

  Data.fromJson(Map<String, dynamic> json) {
    matchId = json['match_id'];
    uniqueId = json['unique_id'];
    team1 = json['team1'];
    team2 = json['team2'];
    date = json['date'];
    dateTimeGMT = json['dateTimeGMT'];
    team1Image = json['team1_image'];
    team2Image = json['team2_image'];
    if (json['contests'] != null) {
      contests = new List<Contests>();
      json['contests'].forEach((v) {
        contests.add(new Contests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['match_id'] = this.matchId;
    data['unique_id'] = this.uniqueId;
    data['team1'] = this.team1;
    data['team2'] = this.team2;
    data['date'] = this.date;
    data['dateTimeGMT'] = this.dateTimeGMT;
    data['team1_image'] = this.team1Image;
    data['team2_image'] = this.team2Image;
    if (this.contests != null) {
      data['contests'] = this.contests.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contests {
  String contestId;
  String contestCode;
  String contestName;
  String winingAmount;
  String contestSize;
  String entryFee;
  String meParticipate;

  Contests(
      {this.contestId,
      this.contestCode,
      this.contestName,
      this.winingAmount,
      this.contestSize,
      this.entryFee,
      this.meParticipate});

  Contests.fromJson(Map<String, dynamic> json) {
    contestId = json['contest_id'];
    contestCode = json['contest_code'];
    contestName = json['contest_name'];
    winingAmount = json['wining_amount'];
    contestSize = json['contest_size'];
    entryFee = json['entry_fee'];
    meParticipate = json['me_participate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contest_id'] = this.contestId;
    data['contest_code'] = this.contestCode;
    data['contest_name'] = this.contestName;
    data['wining_amount'] = this.winingAmount;
    data['contest_size'] = this.contestSize;
    data['entry_fee'] = this.entryFee;
    data['me_participate'] = this.meParticipate;
    return data;
  }
}
