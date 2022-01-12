import 'package:carteiravip/app/shared/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:carteiravip/app/modules/home/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  final pageController = PageController();
  int get indexPage => pageController?.page?.round() ?? 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max, // faz o row pegar o maximo da tela
            mainAxisAlignment: MainAxisAlignment.spaceAround, // alinha os itens no row
            children: <Widget>[
              InkWell(
                onTap: () => {},
                child: FaIcon(FontAwesomeIcons.qrcode, color: corSecundaria),
              ),
              InkWell(
                onTap: () => {
                },
                child: SizedBox(
                  child: new Image.asset("lib/app/shared/assets/logoteste2.png"),
                  width: 150,
                  height: 80,
                )
              ),
            ],
          ),
        ),
      ),

      body: PageView(
        controller: pageController,
        children: <Widget>[
          
          Center(
            child: Container(
              child: Text('pagina principal', style: TextStyle(
              color: Colors.black
            )),
            ),
          ),
          
          Center(
            child: Container(
              child: Text('pagina perfil do usuário', style: TextStyle(
              color: Colors.black
            )),
            ),
          ),
          
        ],
      ),

      bottomNavigationBar: AnimatedBuilder(
        animation: pageController,
        builder: (_,__){
        return BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          onTap: (index){
                pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut
                );
          },
          currentIndex: indexPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: corSecundaria, size: 25),
              title: Text('Home', style: TextStyle(
                color: corSecundaria
              )),
              activeIcon: Icon(Icons.home, color: corSecundaria, size: 35)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: corSecundaria, size: 25),
              title: Text('Perfil',style: TextStyle(
                color: corSecundaria
              )),
              activeIcon: Icon(Icons.person, color: corSecundaria, size: 35)
            )
          ],
      );
      }
     ),

    );
  }
}
