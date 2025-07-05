import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_header.dart';
import 'api_response.dart';

class ApiHelper {
  static const String _baseUrl = 'https://api.imgflip.com';

  static apiGetMemes() async {
    var url = Uri.parse('$_baseUrl/get_memes');

    var headerPost = apiHeader();

    var response = await http.get(url, headers: headerPost);
    var statusCode = response.statusCode;
    var reasonPhrase = response.reasonPhrase;

    var body = response.body;
    var decode = json.decode(body);

    if (apiResponse(statusCode)) {
      return decode;
    } else {
      throw '$reasonPhrase';
    }
  }
}
