import 'package:http/http.dart' as http;
import 'package:livingspirit/utils/debug_utils.dart';

class NetworkUtility {
  static Future<String?> fetchUrl(Uri uri,
      {Map<String, String>? header}) async {
    try {
      final response = await http.get(uri, headers: header);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      consoleLog(e.toString());
    }
    return null;
  }
}
