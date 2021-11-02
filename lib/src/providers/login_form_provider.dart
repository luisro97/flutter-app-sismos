import 'package:flutter/material.dart';

//Clase de tipo ChangeNotifier que nos permite notificar cambios a la app
class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading ( bool value ) {
    _isLoading = value;
    notifyListeners();
  }
}