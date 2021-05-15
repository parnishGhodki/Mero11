class userInfo {
  String status;
  String message;
  Data data;

  userInfo({this.status, this.message, this.data});

  userInfo.fromJson(Map<String, dynamic> json) {
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
  String userId;
  String socialType;
  String socialId;
  String name;
  String mobileNo;
  String email;
  String profilePic;
  String dob;
  String gender;
  String country;
  String state;
  String city;
  String registrationDate;

  Data(
      {this.userId,
      this.socialType,
      this.socialId,
      this.name,
      this.mobileNo,
      this.email,
      this.profilePic,
      this.dob,
      this.gender,
      this.country,
      this.state,
      this.city,
      this.registrationDate});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    socialType = json['social_type'];
    socialId = json['social_id'];
    name = json['name'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    profilePic = json['profile_pic'];
    dob = json['dob'];
    gender = json['gender'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    registrationDate = json['registration_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['social_type'] = this.socialType;
    data['social_id'] = this.socialId;
    data['name'] = this.name;
    data['mobile_no'] = this.mobileNo;
    data['email'] = this.email;
    data['profile_pic'] = this.profilePic;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['registration_date'] = this.registrationDate;
    return data;
  }
}
