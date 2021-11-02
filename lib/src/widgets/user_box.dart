import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:appsismos/src/models/integrante.dart';
import 'package:appsismos/src/providers/integrantes_provider.dart';

class UserBox extends StatelessWidget {
  static List<Integrante> integrantesProvider = integrantes;
  const UserBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _users(integrantesProvider, context),
    );
  }

  List<Widget> _users(List<Integrante> data, BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Widget> usuarios = [];
    for (var i = 0; i < data.length; i++) {
      final widgetTemp = Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: size.width * 0.9,
          height: size.height * 0.2,
          decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 5), color: Colors.black12, blurRadius: 12)
              ]),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      ClipRRect(
                        child:
                            Image.asset(data[i].asset, height: 70, width: 70),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(data[i].nombre,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                          )),
                      RichText(
                          text: TextSpan(
                              children: [
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            TextSpan(text: data[i].gustos)
                          ],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16))),
                      RichText(
                          text: TextSpan(
                              children: [
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.handyman_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            TextSpan(text: data[i].preferencia)
                          ],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16))),
                      RichText(
                          text: TextSpan(
                              children: [
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.code_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            TextSpan(text: data[i].lenguaje)
                          ],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16))),
                    ],
                  ),
                ),
              ),
            ],
          ));
      usuarios.add(widgetTemp);
    }
    return usuarios;
  }
}
