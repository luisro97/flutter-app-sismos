import 'package:flutter/material.dart';
import 'package:appsismos/src/pages/details_page.dart';
import 'package:appsismos/src/pages/group_page.dart';
import 'package:appsismos/src/pages/home_page.dart';
import 'package:appsismos/src/pages/sign_in_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomePage.routeName : (BuildContext context) => HomePage(),          //Ruta del listado de todos los sismos
    SignInPage.routeName : (BuildContext context) => const SignInPage(),      //Ruta de la pagina de inicio de sesion
    GroupPage.routeName : (BuildContext context) => const GroupPage(),        //Ruta de la pagina de integrantes del grupo
    DetailsPage.routeName : (BuildContext context) => DetailsPage(),    //Ruta de la pagina de detalles del sismo
  };
}