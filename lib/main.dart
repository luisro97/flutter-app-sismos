import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appsismos/src/providers/sismos_provider.dart';
import 'package:appsismos/src/routes/routes.dart';

void main() {
  runApp(AppState());
}

// ignore: use_key_in_widget_constructors
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: ( _ ) => SismosProvider(), lazy: false,),
    ],
    child: MyApp());
  }
}


// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Sismos APP',
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),     //Rutas de la aplicacion
      initialRoute: '/signin',            //Ruta inicial
    );
  }
}