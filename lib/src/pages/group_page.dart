import 'package:flutter/material.dart';
import 'package:appsismos/src/widgets/drawer_view.dart';
import 'package:appsismos/src/widgets/user_box.dart';

class GroupPage extends StatelessWidget {
  static const String routeName = '/group';
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Desarrolladores'),
          centerTitle: true,
          backgroundColor: Colors.teal),
      backgroundColor: Colors.white12,
      drawer: const DrawerView(),
      body: const Center(child:UserBox()),
    );
  }
}
