import 'package:carteiravip/app/modules/home/home_controller.dart';
import 'package:carteiravip/app/shared/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecuperarSenha extends StatefulWidget {
  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends ModularState<RecuperarSenha, HomeController> {
   Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'E-mail',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.email, color: corBotao),
              hintText: 'Seu E-mail',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _btnRecuperarSenha() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 7.0,
        onPressed: () => {},
        padding: EdgeInsets.all(3.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: corBotao,
        child: Text(
          'RECUPERAR SENHA',
          style: TextStyle(
            color: corSecundaria,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  
    Widget _informacao() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => {},
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Informe o seu E-mail para podermos recuperar sua senha',
          style: kLabelStyle,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      corSecundaria,
                      corFundo,
                      corFundo,
                      corSecundaria,
                    ],
                    stops: [0.1, 0.2, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          InkWell(
                            child: Icon(Icons.arrow_back, color: Colors.black),
                            onTap: () => Modular.to.pop(),
                          ),
                          SizedBox(width: 30.0),
                          Text("RECUPERE SUA SENHA", style: kLabelStyle),
                        ],
                      ),
                      SizedBox(height: 80.0),
                      _informacao(),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      _btnRecuperarSenha(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}