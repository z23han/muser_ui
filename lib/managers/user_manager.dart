import 'package:muser_ui/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:muser_ui/utils/config.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

// access to global variables
GetIt getIt = GetIt.instance;

final String userUrl = Config.url() + "users/";

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

    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = json.decode(response.body);
      await getIt<FlutterSecureStorage>().write(key: 'auth_token', value: responseMap['token']);
      User u = convertDynamic2User(responseMap['user']);
      await getIt<FlutterSecureStorage>().write(key: 'user', value: jsonEncode(u));
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> guestLogin(String key, String password) async {

    final String guestUser = Config.guestUser;

    final String guestPassword = Config.guestPassword;

    final String guestToken = Config.guestToken;

    if (key != guestUser || password != guestPassword) {
      return false;
    }

    await getIt<FlutterSecureStorage>().write(key: 'auth_token', value: guestToken);

    User user = User(guestUser, guestPassword, '', '25', '123456789', 'Toronto', true);

    await getIt<FlutterSecureStorage>().write(key: 'user', value: jsonEncode(user));

    return true;
  }

  static User convertDynamic2User(dynamic d) {
    String name = d['name'];
    String password = d['password'];
    String age = d['age'];
    String gender = d['gender'];
    String city = d['city'];
    String phone = d['phone'];
    bool isConsented = true;

    User res = User(name, password, gender, age, phone, city, isConsented);
    return res;
  }

  static Future<bool> validateToken() async {

    bool guestMode = Config.guestMode;

    String token = await getIt<FlutterSecureStorage>().read(key: 'auth_token');

    if (guestMode) {

      final String guestToken = Config.guestToken;

      if (token == guestToken) {

        return true;
      } else {
        return false;
      }
    } else {

      String url = userUrl + "get";

      final http.Response response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token
        },
      );

      if (response.statusCode == 200) {

        Map<String, dynamic> responseMap = json.decode(response.body);

        User u = convertDynamic2User(responseMap['user']);

        await getIt<FlutterSecureStorage>().write(key: 'user', value: jsonEncode(u));

        return true;
      } else {

        return false;
      }
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

  static Future<User> getUserFromStorage() async {
    String userString = await getIt<FlutterSecureStorage>().read(key: 'user');
    Map userMap = jsonDecode(userString);
    User res = User.fromJson(userMap);
    return res;
  }

  static void removeUserToken() async{
    await getIt<FlutterSecureStorage>().delete(key: 'user');
    await getIt<FlutterSecureStorage>().delete(key: 'auth_token');
  }
}