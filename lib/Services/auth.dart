import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:news_app/Models/User.dart';
import 'package:news_app/Utls/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static final Dio _dio = Dio();

  static User? signedUser;

  static Future<bool> login(User model) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${MajorAuth.firebaseKey}';

    var response = await _dio.post(
      url,
      data: json.encode(
        {'email': model.Email, 'password': model.Password},
      ),
    );
    signedUser = User.LoggedUser(
      response.data['localId'],
      response.data['idToken'],
      DateTime.now().add(const Duration(seconds: 3600)),
    );
    signedUser!.Email = model.Email;
    // signedUser = User.Login(response.data['localId'], response.data['idToken']);
    final prefs = await SharedPreferences.getInstance();
    List<String> data = [signedUser!.Id, signedUser!.Email, signedUser!.token];
    prefs.setStringList('userdata', data);

    return true;
  }

  static Future<bool> register(User model) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${MajorAuth.firebaseKey}';

    try {
      final response = await _dio.post(
        url,
        data: json.encode(
          {
            'email': model.Email,
            'password': model.Password,
            'returnSecureToken': true,
          },
        ),
      );
      signedUser = User.LoggedUser(
        response.data['localId'],
        response.data['idToken'],
        DateTime.now()
            .add(Duration(seconds: int.parse(response.data['expiresIn']))),
      );
      signedUser!.Email = model.Email;

      final prefs = await SharedPreferences.getInstance();
      List<String> data = [
        signedUser!.Id,
        signedUser!.Email,
        signedUser!.token
      ];
      prefs.setStringList('userdata', data);
      return true;
    } catch (error) {
      return false;
    }
  }

  static Future<bool> isSigned() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getStringList('userdata');
    if (token != null) {
      signedUser = User.LoggedUser(
        token[0],
        token[2],
        DateTime.now().add(const Duration(seconds: 3600)),
      );
      signedUser!.Email = token[1];
      return true;
    }
    return false;
  }
}
