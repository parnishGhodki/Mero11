import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class JoinContest {
  Future getLeaderBoard() {
    //code to get leader board
  }

  Future getPrizeDistribution() {
    //code to get prize distribution
  }

  Future getUserTeam(String userid, String matchid) async {
    final Uri uri = Uri.parse("https://mero11.com/wb/my_teams");

    final response =
        await http.post(uri, body: {"user_id": userid, "match_id": matchid});

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseString =
          JSON.jsonDecode(response.body);
      print(response.body);

      return true;
    } else {
      return false;
    }
  }

  Future createUserTeam(String userid, String matchid) async {
    final Uri uri = Uri.parse("https://mero11.com/wb/create_team");

    final response =
        await http.post(uri, body: {"user_id": userid, "match_id": matchid});

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
