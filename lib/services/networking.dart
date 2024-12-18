import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    final uri = Uri.parse(url);
    Response response = await get(uri);

    if(response.statusCode == 200) {

      return jsonDecode(response.body);

    } else {
      response.statusCode;
    }

  }

}