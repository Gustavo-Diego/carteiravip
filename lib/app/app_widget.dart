import 'package:carteiravip/app/shared/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// 252, 110, 55, 228 cor secundaria, 177, 242, 253 , ////////////// 204, 210, 214

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: corFundo),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
