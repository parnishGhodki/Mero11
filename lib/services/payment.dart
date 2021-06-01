import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class Payment {
  Future initiatePayment(
    String mobile,
    String transaction_pin,
    String amount,
  ) async {
    final Uri uri = Uri.parse("https://khalti.com/api/v2/payment/initiate/");

    final response = await http.post(uri, body: {
      "public_key": 'test_public_key_ea47214155dd465e8912a3bdc176ae46',
      "mobile": 9893541796,
      "transaction_pin": 1234,
      "amount": 100,
      "product_identity": 'amount',
      "product_name": 'mero11',
      "product_url": 'https://www.mero11.com'
    });

    print(response);
  }

  Future confirmPayment() async {
    final Uri uri = Uri.parse("https://khalti.com/api/v2/payment/confirm/");

    final response = await http.post(uri, body: {
      "public_key": 0,
      "token": 0,
      "cinfirmation_code": 0,
      "transaction_pin": 0
    });

    print(response);
  }
}
