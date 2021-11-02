import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appsismos/src/models/create_user_response.dart';
import 'package:appsismos/src/models/sign_in_response.dart';
import 'package:appsismos/src/models/sismos_response.dart';

class SismosProvider extends ChangeNotifier {
  final String _baseUrl = 'api.jkd.cl';
  List<Datum> listaSismos = [];
  SismosProvider() {
    getSismos();
  }

  getSismos() async {
    //Intenta crear un usuario
    try {
      await createUser('flutter', 'flutter@mail.com', 'flutter1234');
    } catch (e) {
      //Si la cracion falla al estar registrado, se inicia sesion para generar token
      final AuthResponse usuario =
          await signInUser('flutter@mail.com', 'flutter1234');
      String token = usuario.token;
      var url = Uri.https(_baseUrl, '/grupo-x/earthquakes');
      //Se realiza la peticion
      final response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});
      //Se procesan los datos
      final sismosResponse = SismosResponse.fromJson(response.body);
      listaSismos = sismosResponse.data;
    }
    notifyListeners();
  }
}

//Peticion para crear usuario
Future<UsersResponse> createUser(
    String username, String email, String password) async {
  String _baseUrl = 'api.jkd.cl';
  var url = Uri.https(_baseUrl, '/grupo-x/users');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8'
    },
    body:
        jsonEncode({'username': username, 'email': email, 'passwrd': password}),
  );
  if (response.statusCode == 200) {
    final String responseString = response.body;
    return userResponseFromJson(responseString);
  } else {
    throw Exception();
  }
}

//Peticion para generar token de usuario ya creado
Future<AuthResponse> signInUser(String email, String password) async {
  String _baseUrl = 'api.jkd.cl';
  var url = Uri.https(_baseUrl, '/grupo-x/auth/signin');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode({'email': email, 'passwrd': password}),
  );
  if (response.statusCode == 200) {
    final String responseString = response.body;
    return authResponseFromJson(responseString);
  } else {
    throw Exception();
  }
}
