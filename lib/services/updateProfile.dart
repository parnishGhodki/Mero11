import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class UpdateProfile {
  Future<String> update(
      String userid,
      String name,
      String mobileno,
      String email,
      String dob,
      String gender,
      String country,
      String state,
      String city) async {
    final Uri uri = Uri.parse("https://mero11.com/wb/update_profile");

    final response = await http.post(uri, body: {
      "user_id": userid,
      "name": name,
      "mobile_no": mobileno,
      "email": email,
      "dob": dob,
      "gender": gender,
      "country": country,
      "state": state,
      "city": city
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseString =
          JSON.jsonDecode(response.body);
      print(response.body);

      return responseString['message'];
    } else {
      return null;
    }
  }
}
