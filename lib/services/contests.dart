import 'package:cricketfantasy/model/contests_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class GetContests {
  ContestInfo contestInfo = ContestInfo();

  Future<List<Contests>> getInfo(String userid, String matchid) async {
    List<Contests> contestList = List<Contests>();

    final Uri uri = Uri.parse("https://mero11.com/wb/contests_list");

    final response =
        await http.post(uri, body: {"user_id": userid, "match_id": matchid});

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseString =
          JSON.jsonDecode(response.body);
      print(response.body);
      contestInfo = ContestInfo.fromJson(responseString);
      Data data = Data();
      data = contestInfo.data;

      return data.contests;
    } else {
      return null;
    }
  }
}

class CreateContest {
  Future<bool> createContest(String userid, String matchid, String contestname,
      String winningamount, String contestsize) async {
    final Uri uri = Uri.parse("https://mero11.com/wb/make_contest");

    final response = await http.post(uri, body: {
      "user_id": userid,
      "match_id": matchid,
      "contest_name": contestname,
      "winning_amount": winningamount,
      "contest_size": contestsize
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseString =
          JSON.jsonDecode(response.body);
      print(response.body);

      return true;
    } else {
      return false;
    }
  }
}

class EnterContest {
  Future<bool> joinContest(String userid, String contestcode) async {
    final Uri uri = Uri.parse("https://mero11.com/wb/entry_contest_using_code");

    final response = await http.post(uri, body: {
      "user_id": userid,
      "contest_code": contestcode,
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseString =
          JSON.jsonDecode(response.body);
      print(response.body);

      return true;
    } else {
      return false;
    }
  }
}
