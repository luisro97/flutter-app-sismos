class Integrante {
  String _nombre;
  String _asset;
  String _gustos;
  String _preferencia;
  String _lenguaje;

  Integrante(this._nombre, this._asset, this._gustos, this._preferencia,
      this._lenguaje);

  String get lenguaje => _lenguaje;

  String get preferencia => _preferencia;

  String get gustos => _gustos;

  String get asset => _asset;

  String get nombre => _nombre;

  set lenguaje(String value) {
    _lenguaje = value;
  }

  set preferencia(String value) {
    _preferencia = value;
  }

  set gustos(String value) {
    _gustos = value;
  }

  set asset(String value) {
    _asset = value;
  }

  set nombre(String value) {
    _nombre = value;
  }
}

