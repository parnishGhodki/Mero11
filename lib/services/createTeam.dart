import 'package:cricketfantasy/model/player_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class GetPalyersList {
  Future<List<Data>> getpalyersList(String matchid, String userid) async {
    PlayersList playerlist = PlayersList();
    final Uri uri = Uri.parse("https://mero11.com/wb/players_list");

    final response =
        await http.post(uri, body: {"user_id": userid, "match_id": matchid});

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseString =
          JSON.jsonDecode(response.body);
      print(response.body);

      playerlist = PlayersList.fromJson(responseString);

      return playerlist.data;
    } else {
      return null;
    }
  }
}

class CreateTeam {
  Future<bool> createTeam(
      List<Data> wklist,
      List<Data> batsmenlist,
      List<Data> allrounderlist,
      List<Data> bowlerlist,
      String userid,
      String matchid,
      String captain,
      String vice_captain) async {
    final Uri uri = Uri.parse("https://mero11.com/wb/create_team");
    List<Data> allPlayersList = List();

    allPlayersList.addAll(batsmenlist);
    allPlayersList.addAll(wklist);
    allPlayersList.addAll(bowlerlist);
    allPlayersList.addAll(allrounderlist);

    final response = await http.post(uri, body: {
      "user_id": userid,
      "match_id": matchid,
      "pid1": allPlayersList[0].pid,
      "pid2": allPlayersList[1].pid,
      "pid3": allPlayersList[2].pid,
      "pid4": allPlayersList[3].pid,
      "pid5": allPlayersList[4].pid,
      "pid6": allPlayersList[5].pid,
      "pid7": allPlayersList[6].pid,
      "pid8": allPlayersList[7].pid,
      "pid9": allPlayersList[8].pid,
      "pid10": allPlayersList[9].pid,
      "pid11": allPlayersList[10].pid,
      "wk": [],
      "bat": [],
      "captain": captain,
      "bowl": [],
      "ar": [],
      "voice_captain": vice_captain,
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
