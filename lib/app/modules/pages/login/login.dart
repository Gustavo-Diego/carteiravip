import 'package:carteiravip/app/modules/home/home_controller.dart';
import 'package:carteiravip/app/shared/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ModularState<Login, HomeController> {
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
              prefixIcon: Icon(
                Icons.email,
                color: corBotao
              ),
              hintText: 'Seu E-mail',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Senha',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: corBotao,
              ),
              hintText: 'Sua senha',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _btnLogar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 7.0,
        onPressed: () => Modular.to.pushNamedAndRemoveUntil(
          '/Principal',
          (route)=>false
        ),
        padding: EdgeInsets.all(3.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: corBotao,
        child: Text(
          'LOGAR',
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

  Widget _ouText() {
    return Column(
      children: <Widget>[
        Text(
          '- OU -',
          style: TextStyle(
            color: corOU,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _logarComText() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Text(
          'Logar com:',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _btnSocial(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _btnSocialRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _btnSocial(
            () => print('Login with Facebook'),
            AssetImage(
              'lib/app/shared/assets/logosExternos/facebook.jpg',
            ),
          ),
          _btnSocial(
            () => print('Login with Google'),
            AssetImage(
              'lib/app/shared/assets/logosExternos/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _btnForgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => Modular.to.pushNamed('/RecuperarSenha'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Esqueceu sua senha?',
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
                      corFundo,
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
                            child: Icon(Icons.arrow_back, color:Colors.black),
                            onTap: () => Modular.to.pop(context),
                          ),
                          SizedBox(width: 30.0),
                          Text("LOGIN", style:kLabelStyle),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(height: 30.0),
                      _buildPasswordTF(),
                      _btnLogar(),
                      _ouText(),
                      _logarComText(),
                      _btnSocialRow(),
                      _btnForgotPassword(),
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