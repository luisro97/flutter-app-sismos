import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appsismos/src/providers/sismos_provider.dart';
import 'package:appsismos/src/widgets/drawer_view.dart';
import 'package:appsismos/src/widgets/list_view.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    //Variable que tiene los datos de los sismos, obtenidos desde la base de datos con la API
    final sismosProvider = Provider.of<SismosProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de sismos'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        backgroundColor: Colors.white12,
        drawer: const DrawerView(),
        //Boton para recargar los datos
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Future.delayed(const Duration(seconds: 3), () {
              Provider.of<SismosProvider>(context, listen: false).getSismos();
            });
          },
          backgroundColor: Colors.teal,
          child: const Icon(
            Icons.autorenew_rounded,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        //Se dibuja Lista con los datos de los sismos
        body: Lista(sismos: sismosProvider.listaSismos));
  }
}
