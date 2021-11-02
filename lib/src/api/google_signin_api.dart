import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();    //Definimos una variable con funciones de GoogleSignIn
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();     //Definimos una funcion que utiliza el metodo signIn
  static Future logout() => _googleSignIn.disconnect();     //Definimos una funcion que utiliza el metodo disconnect para realizar un logout
}