// To parse this JSON data, do
//
//     final sismosResponse = sismosResponseFromMap(jsonString);

import 'dart:convert';

class SismosResponse {
  SismosResponse({
    required this.data,
  });

  List<Datum> data;

  factory SismosResponse.fromJson(String str) => SismosResponse.fromMap(json.decode(str));

  factory SismosResponse.fromMap(Map<String, dynamic> json) => SismosResponse(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );
}

//Clase con los datos de los sismos
class Datum {
  Datum({
    required this.idRegistro,
    required this.fechaLocal,
    required this.latitud,
    required this.longitud,
    required this.profundidad,
    required this.magnitud,
    required this.refGeografica,
  });

  String idRegistro;
  String fechaLocal;
  double latitud;
  double longitud;
  int profundidad;
  double magnitud;
  String refGeografica;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    idRegistro: json["id_registro"],
    fechaLocal: json["fecha_local"],
    latitud: json["latitud"].toDouble(),
    longitud: json["longitud"].toDouble(),
    profundidad: json["profundidad"],
    magnitud: json["magnitud"].toDouble(),
    refGeografica: json["ref_geografica"],
  );
}
