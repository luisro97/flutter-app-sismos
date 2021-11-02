import 'package:flutter/material.dart';

class SignInBackground extends StatelessWidget {
  final Widget child;

  const SignInBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [_TealBox(), _HeaderIcon(), child],
      ),
      decoration: const BoxDecoration(
          color: Colors.blueGrey,
          backgroundBlendMode: BlendMode.darken,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.4, 1],
              colors: [Colors.teal, Colors.black54])),
    );
  }
}

//Icono de la pantalla de login
class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 100),
            child:
                const Icon(Icons.person_pin, color: Colors.white, size: 100)));
  }
}

//Cuadrado de la pantalla de login
class _TealBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      color: Colors.teal,
    );
  }
}
