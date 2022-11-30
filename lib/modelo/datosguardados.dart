// ignore_for_file: file_names, non_constant_identifier_names
// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class datosguardaos extends StatelessWidget {
  final nombres = TextEditingController();
  final salarios = TextEditingController();

  datosguardaos({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db;
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado de usuarios"),
        backgroundColor: Color.fromARGB(45, 95, 255, 0),
      ),
    );
  }
}

void conexion() async {
  var db = FirebaseFirestore.instance;
  await db.collection("usuarios").get().then((event) {
    for (var doc in event.docs) {
      print("${doc.id} => ${doc.data()}");
    }
  });
}

void alerta_mensaje(BuildContext context, String mensaje) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Mensaje"),
            content: Text(mensaje),
          ));
}
