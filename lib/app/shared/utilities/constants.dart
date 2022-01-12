import 'package:flutter/material.dart';

final Color corFundo = Color.fromARGB(255, 177, 242, 253);

final Color corSecundaria = Color.fromARGB(255, 142, 8, 255);

final Color corBotao = Color.fromARGB(255, 255, 255, 255);

final Color corOU = Color.fromARGB(255, 244, 111, 22);

final kHintTextStyle = TextStyle(
    color: corBotao,
    fontFamily: 'OpenSans',
  );

  final kLabelStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );

  final kBoxDecorationStyle = BoxDecoration(
    color: corSecundaria,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        blurRadius: 26.0,
        offset: Offset(1, 7),
      ),
    ],
  );

  final kTitleStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'CM Sans Serif',
    fontSize: 25.0,
    height: 1.0,
  );

  final kSubtitleStyle = TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    height: 1.2,
  );