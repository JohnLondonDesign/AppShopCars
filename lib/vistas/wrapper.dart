import 'package:provider/provider.dart';
import 'package:auth_login_demo/vistas/home/home.dart';
import 'package:flutter/material.dart';

import '../modelo/firebaseuser.dart';
import 'authenticate/handler.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);
    if (user == null) {
      return Handler();
    } else {
      return Home();
    }
  }
}
