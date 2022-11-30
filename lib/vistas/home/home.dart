// ignore_for_file: dead_code

import 'package:auth_login_demo/controlador/auth.dart';
import 'package:flutter/material.dart';

// import '../../modelo/datosguardaos.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    final SignOut = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,

      // child: MaterialButton(
      //   minWidth: MediaQuery.of(context).size.width,
      //   padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      //   onPressed: () async {
      //     await _auth.signOut();
      //   },
      //   child: Text(
      //     "Cerrar Sesión",
      //     style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
      //     textAlign: TextAlign.center,
      //   ),
      // ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo_1.png",
          height: 120,
          width: 240,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _auth.signOut();
        },
        // ignore: sort_child_properties_last
        child: const Icon(Icons.login),
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 2,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.star), label: 'Favoritos'),
          NavigationDestination(icon: Icon(Icons.home), label: 'Inicio'),
          NavigationDestination(icon: Icon(Icons.car_crash), label: 'Compra'),
        ],
      ),
      // ignore: prefer_const_constructors
      body: ListView(children: [
        Image.asset(
          'assets/vehiculo.png',
          width: 200,
          height: 120,
        ),
        Image.asset(
          'assets/logo_1.png',
          width: 800,
          height: 240,
        ),
      ]

          // child: SignOut,
          ),
    );
  }
}
