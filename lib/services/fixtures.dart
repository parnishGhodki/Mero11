import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class fixtureResponse {
  Future<List<Data1>> getFixtures(String userid) async {
    List<Data1> data1 = List<Data1>();
    fixture matches = fixture();
    final Uri uri = Uri.parse("https://mero11.com/wb/match_list");

    final response = await http.post(uri, body: {
      "user_id": userid,
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseString =
          JSON.jsonDecode(response.body) as Map<String, dynamic>;
      print(response.body);

      matches = fixture.fromJson(responseString);

      return matches.data1;
    } else {
      return null;
    }
  }
}
