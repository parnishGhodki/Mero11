import 'package:cricketfantasy/model/contestHistory.dart';
import 'package:cricketfantasy/model/transaction_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class Bank {
  Future<Wallet> getWallet(String userid) async {
    final Uri uri = Uri.parse("https://mero11.com/wb/wallet");

    final response = await http.post(uri, body: {
      "user_id": userid,
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseString =
          JSON.jsonDecode(response.body);
      print(response.body);

      return Wallet.fromJson(responseString);
    } else {
      return null;
    }
  }
}

class History {
  Future<ContestHistory> getWallet(String userid) async {
    final Uri uri = Uri.parse("https://mero11.com/wb/history");

    final response = await http.post(uri, body: {
      "user_id": userid,
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseString =
          JSON.jsonDecode(response.body);
      print(response.body);

      return ContestHistory.fromJson(responseString);
    } else {
      return null;
    }
  }
}
