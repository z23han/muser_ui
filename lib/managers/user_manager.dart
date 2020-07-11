import 'package:muser_ui/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:muser_ui/utils/config.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

// access to global variables
GetIt getIt = GetIt.instance;

final String userUrl = Config.url + "users/";

class UserManager {
  static Future<bool> login(String key, String password) async {
    String url = userUrl + "login";
    var resBody = {};
    resBody["password"] = password;

    if (double.tryParse(key) != null) {
      resBody["phone"] = key;
    } else {
      resBody["name"] = key;
    }

    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(resBody),
    );
    print("received response");

    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = json.decode(response.body);
      await getIt<FlutterSecureStorage>().write(key: 'auth_token', value: responseMap['token']);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> validateToken() async {
    String url = userUrl + "get";
    String token = await getIt<FlutterSecureStorage>().read(key: 'auth_token');

    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> register(User user) async {
    String url = userUrl + "register";
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(user)
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}