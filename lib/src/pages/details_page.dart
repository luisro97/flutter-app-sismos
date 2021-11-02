import 'package:flutter/material.dart';
import 'package:appsismos/src/models/sismos_response.dart';
import 'package:appsismos/src/widgets/details_view.dart';
import 'package:appsismos/src/widgets/map_container.dart';

// ignore: use_key_in_widget_constructors
class DetailsPage extends StatelessWidget {
  static const routeName = '/detailsPage';
  @override
  Widget build(BuildContext context) {
    final sismos = ModalRoute.of(context)!.settings.arguments as Datum;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles del sismo'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        backgroundColor: Colors.white12,
        body: Column(
          children: [
            //Dibujamos el mapa de google
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: MapContainer(
                sismo: sismos,
              ),
            ),
            //Dibujamos los detalles
            Flexible(
                flex: 1, fit: FlexFit.tight, child: DetailsView(sismos: sismos))
          ],
        ));
  }
}
