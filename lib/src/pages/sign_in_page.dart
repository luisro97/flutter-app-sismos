import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:appsismos/src/api/google_signin_api.dart';
import 'package:appsismos/src/pages/home_page.dart';
import 'package:appsismos/src/providers/login_form_provider.dart';
import 'package:appsismos/src/widgets/card_container.dart';
import 'package:appsismos/src/widgets/sign_in_background.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);
  static const routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 250),
            //Caja de inicio de sesion
            CardContainer(
                child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Inicio de sesion',
                  style: TextStyle(fontSize: 35),
                ),
                ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(), child: _LoginForm()),
              ],
            ))
          ],
        ),
      )),
    );
  }
}

//Formulario de inicio de sesion
class _LoginForm extends StatefulWidget {
  @override
  State<_LoginForm> createState() => _LoginFormState();
}

//Contenido de la caja de inicio de sesion
class _LoginFormState extends State<_LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const SizedBox(height: 30),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            minWidth: 150,
            height: 60,
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.teal,
            child: const Text(
              'Iniciar',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () async {
              setState(() {
                signIn(context);
              });
            },
          )
        ],
      ),
    );
  }

  //Inicio de sesion
  Future signIn(context) async {
    final user = await GoogleSignInApi.login();
    var emailDomain = user!.email.split('@');
    //Comprobamos el domionio
    if (emailDomain[1] == 'utem.cl') {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      await GoogleSignInApi.logout();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('La cuenta ingresada no pertenece al dominio utem.cl')));
    }
  }
}
