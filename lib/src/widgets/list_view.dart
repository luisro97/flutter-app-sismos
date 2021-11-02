import 'package:flutter/material.dart';
import 'package:appsismos/src/pages/details_page.dart';
import 'package:appsismos/src/models/sismos_response.dart';

class Lista extends StatefulWidget {
  final List<Datum> sismos;
  const Lista({Key? key, required this.sismos}) : super(key: key);

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildList(),
    );
  }

  //Comprobamos que la lista no este vacia
  Widget buildList() => widget.sismos.isEmpty
      //Si esta vacia, se muestra un texto en pantalla
      ? Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
                child: CircularProgressIndicator(
              color: Colors.teal,
            )),
            SizedBox(
              height: 10,
            ),
            Text(
              'Algo fue mal... o quiza no hay registros',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              'Intenta presionando el boton de abajo!',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ))
      //Si no esta vacia se dibuja la lista
      : ListView.builder(
          itemCount: widget.sismos.length,
          itemBuilder: (context, index) {
            final data = widget.sismos[index];
            return buildItem(data, context);
          },
        );
  //Esta funcion dibuja los ListTile del ListView
  Widget buildItem(Datum data, BuildContext context) => ListTile(
        title: Text(data.refGeografica,
            style: const TextStyle(color: Colors.white)),
        subtitle:
            Text(data.fechaLocal, style: const TextStyle(color: Colors.grey)),
        leading: const Icon(Icons.track_changes_rounded, color: Colors.teal),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        //OnTap que lleva a los detalles del sismo, enviando los datos a traves de arguments para dibujar la pagina
        onTap: () {
          Navigator.pushNamed(context, DetailsPage.routeName, arguments: data);
        },
      );
}
