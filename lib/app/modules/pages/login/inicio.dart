import 'package:carteiravip/app/modules/home/home_controller.dart';
import 'package:carteiravip/app/shared/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends ModularState<Inicio, HomeController> {

  Widget _btnEntrar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 7.0,
        onPressed: () => Modular.to.pushNamed('/Login'),
        padding: EdgeInsets.all(3.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: corBotao,
        child: Text(
          'ENTRAR',
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

  Widget _btnCadastro() {
    return GestureDetector(
      onTap: () => Modular.to.pushNamed('/Cadastro'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Não tem conta? ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Cadastre-se',
              style: TextStyle(
                color: corSecundaria,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
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
                      corSecundaria,
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
                    vertical: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height/1.8,
                        child: PageView(
                          physics: ClampingScrollPhysics(),
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child: Image(
                                      image: AssetImage(
                                        'lib/app/shared/assets/imgLogin1.jpg',
                                      ),
                                      height: MediaQuery.of(context).size.height / 4,
                                      width: MediaQuery.of(context).size.width /1.3,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 30.0),
                                  Text(
                                    'Descubra os melhores lugares perto de você',
                                    style: kTitleStyle,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Image(
                                      image: AssetImage(
                                        'lib/app/shared/assets/imgLogin2.jpg',
                                      ),
                                      height: MediaQuery.of(context).size.height / 4,
                                      width: MediaQuery.of(context).size.width /1.3,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 30.0),
                                  Text(
                                    'Faça seus pedidos e pagamentos pelo celular',
                                    style: kTitleStyle,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Image(
                                      image: AssetImage(
                                        'lib/app/shared/assets/imgLogin3.jpg',
                                      ),
                                      height: MediaQuery.of(context).size.height / 4,
                                      width: MediaQuery.of(context).size.width /1.3,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 30.0),
                                  Text(
                                    'Venha ser VIP junto com a gente',
                                    style: kTitleStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(),
                      ),
                      _btnEntrar(),
                      _btnCadastro(),
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