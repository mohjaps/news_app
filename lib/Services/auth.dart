import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:news_app/Models/User.dart';
import 'package:news_app/Utls/Colors.dart';

class Auth {
  static final Dio _dio = Dio();

  static User? signedUser;

  static Future<bool> login(User model) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${MajorAuth.firebaseKey}';

    var response = await _dio.post(
      url,
      data: json.encode(
        {
          'email': model.Email,
          'password': model.Password
        },
      ),
    );
    signedUser = User.Login(
        response.data['localId'],
        response.data['idToken']);
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
        DateTime.now().add(Duration(seconds: int.parse(response.data['expiresIn']))),
      );
      return true;
    } catch (error) {
      return false;
    }
  }
}
