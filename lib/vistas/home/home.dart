// ignore_for_file: dead_code, prefer_initializing_formals, unnecessary_new
// ignore: unused_import
import 'dart:convert';
import 'package:auth_login_demo/controlador/auth.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import '../../models/Gif.dart';

// import '../../modelo/datosguardaos.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  final AuthService _auth = new AuthService();

  // ignore: prefer_final_fields, non_constant_identifier_names
  List<Vehiculos> _Vehiculos = [
    Vehiculos("Mazda", "Automovil", '2012'),
    Vehiculos("Chevrolet", "Camioneta", '2023'),
    Vehiculos("Toyota", "Camioneta", '2023'),
    Vehiculos("Honda", "Automovil", '2021'),
  ];

  // late Future<List<Gif>> _listadoGifs;

  // get http => null;
  // Future<List<Gif>> _getGifs() async {
  //   List<Gif> gifs = [];
  //   var url = Uri.parse(
  //       "https://api.giphy.com/v1/gifs/search?api_key=2OjHqOOlZvG8APJnpYqv8CnP0Z5IaNTa&q=car&limit=10&offset=0&rating=g&lang=en");
  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     String body = utf8.decode(response.bodyBytes);
  //     final jsonData = jsonDecode(body);

  //     for (var item in jsonData["data"]) {
  //       gifs.add(Gif(item["title"], item["images"]["downsized"]["url"]));
  //     }
  //     return gifs;
  //   } else {
  //     throw Exception("Falló la conexión");
  //   }
  //   return gifs;
  // }

  // @override
  // void initState() {
  // ignore: todo
  //   // TODO: implement initState
  //   super.initState();
  //   _listadoGifs = _getGifs();
  // }

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

      body: ListView.builder(
          itemCount: _Vehiculos.length,
          itemBuilder: (context, index) {
            return ListTile(
              onLongPress: () {
                _borrarVehiculo(context, _Vehiculos[index]);
              },
              // ignore: prefer_interpolation_to_compose_strings
              title: Text(_Vehiculos[index].marca +
                  ' ' +
                  _Vehiculos[index].Tipo_vehiculo),
              subtitle: Text(_Vehiculos[index].modelo),
              leading: CircleAvatar(
                child: Text(_Vehiculos[index].marca.substring(0, 1)),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            );
          }),

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
      // body: ListView(children: [
      //   Image.asset(
      //     'assets/vehiculo.png',
      //     width: 200,
      //     height: 120,
      //   ),
      //   Image.asset(
      //     'assets/logo_1.png',
      //     width: 800,
      //     height: 240,
      //   ),
      // ]

      // child: SignOut,
    );
  }

  _borrarVehiculo(context, Vehiculos vehiculos) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Eliminar Vehiculo"),
              content: Text(
                  // ignore: prefer_interpolation_to_compose_strings
                  "¿Está seguros de que eliminara el vehiculo marca " +
                      vehiculos.marca +
                      '?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar")),
                TextButton(
                    onPressed: () {
                      // ignore: avoid_print
                      print(vehiculos.marca);
                      setState(() {
                        _Vehiculos.remove(vehiculos);
                      });

                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Borrar",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ));
  }

// // lista Gifs ---------------------------------------------
//   List<Widget> _listGifs(data) {
//     List<Widget> gifs = [];

//     for (var gif in data) {
//       gifs.add(Card(
//           child: Column(
//         children: [
//           Expanded(
//               child: Image.network(
//             gif.url,
//             fit: BoxFit.fill,
//           )),
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: Text(gif.name),
//           // )
//         ],
//       )));
//     }
//     return gifs;
//   }
}

class Vehiculos {
  String marca = '';
  String Tipo_vehiculo = '';
  String modelo = '';

  // ignore: non_constant_identifier_names
  Vehiculos(marca, tipo_vehiculo, modelo) {
    this.marca = marca;
    // ignore: unnecessary_this
    this.Tipo_vehiculo = Tipo_vehiculo;
    this.modelo = modelo;
  }
}
