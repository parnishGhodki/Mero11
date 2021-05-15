class ContestHistory {
  String status;
  String message;
  Data data;

  ContestHistory({this.status, this.message, this.data});

  ContestHistory.fromJson(Map<String, dynamic> json) {
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
  int contest;
  int matches;
  int series;
  int wins;

  Data({this.contest, this.matches, this.series, this.wins});

  Data.fromJson(Map<String, dynamic> json) {
    contest = json['contest'];
    matches = json['matches'];
    series = json['series'];
    wins = json['wins'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contest'] = this.contest;
    data['matches'] = this.matches;
    data['series'] = this.series;
    data['wins'] = this.wins;
    return data;
  }
}
