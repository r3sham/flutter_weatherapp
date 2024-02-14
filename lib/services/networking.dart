import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking{
  Networking(this.Url);
  final Uri Url;
  Future getData() async {
    http.Response response = await http.get(Url);
      return jsonDecode(response.body);
  }
}