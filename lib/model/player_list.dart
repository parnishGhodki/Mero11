class PlayersList {
  String status;
  String message;
  List<Data> data;

  PlayersList({this.status, this.message, this.data});

  PlayersList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String pid;
  String name;
  int points;
  String credit;
  String image;
  String role;

  Data({this.pid, this.role, this.name, this.points, this.credit, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    role = json['playingRole'];
    name = json['name'];
    points = json['points'];
    credit = json['credit'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['palyingRole'] = this.role;
    data['name'] = this.name;
    data['points'] = this.points;
    data['credit'] = this.credit;
    data['image'] = this.image;
    return data;
  }
}
