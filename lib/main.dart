import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'controlador/auth.dart';
import 'modelo/firebaseuser.dart';
import 'vistas/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color.fromARGB(255, 24, 24, 24),
          buttonTheme: ButtonThemeData(
            buttonColor: Color.fromARGB(255, 3, 74, 39),
            textTheme: ButtonTextTheme.primary,
            colorScheme:
                Theme.of(context).colorScheme.copyWith(secondary: Colors.white),
          ),
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
        ),
        home: Wrapper(),
      ),
    );
  }
}
