import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:appsismos/src/models/sismos_response.dart';

class DetailsView extends StatelessWidget {
  final Datum sismos;
  const DetailsView({Key? key, required this.sismos}) : super(key: key);
  //Estilos de title y data
  final myTitleStyle = const TextStyle(fontSize: 16, color: Colors.white);
  final myDataStyle = const TextStyle(fontSize: 16, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      alignment: Alignment.center,
      //Dibujamos los datos
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                  child: Text(
                'Fecha local',
                style: myTitleStyle,
                textAlign: TextAlign.start,
              )),
              Expanded(
                  child: Text(sismos.fechaLocal,
                      style: myDataStyle, textAlign: TextAlign.center)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: Text('Latitud',
                      style: myTitleStyle, textAlign: TextAlign.start)),
              Expanded(
                  child: Text(sismos.latitud.toString(),
                      style: myDataStyle, textAlign: TextAlign.center))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: Text('Longitud',
                      style: myTitleStyle, textAlign: TextAlign.start)),
              Expanded(
                  child: Text(sismos.longitud.toString(),
                      style: myDataStyle, textAlign: TextAlign.center))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: Text('Profundidad',
                      style: myTitleStyle, textAlign: TextAlign.start)),
              Expanded(
                  child: Text(sismos.profundidad.toString() + ' Km',
                      style: myDataStyle, textAlign: TextAlign.center))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: Text('Magnitud',
                      style: myTitleStyle, textAlign: TextAlign.start)),
              Expanded(
                  child: Text(sismos.magnitud.toString() + ' Ml',
                      style: myDataStyle, textAlign: TextAlign.center))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: Text('Referencia geografica',
                      style: myTitleStyle, textAlign: TextAlign.start)),
              Expanded(
                  child: Text(sismos.refGeografica,
                      style: myDataStyle, textAlign: TextAlign.center))
            ],
          )
        ],
      ),
    );
  }
}
