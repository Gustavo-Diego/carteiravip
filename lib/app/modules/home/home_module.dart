import 'package:carteiravip/app/modules/home/home_controller.dart';
import 'package:carteiravip/app/modules/pages/login/cadastro.dart';
import 'package:carteiravip/app/modules/pages/login/login.dart';
import 'package:carteiravip/app/modules/pages/login/recuperarSenha.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:carteiravip/app/modules/pages/home_page.dart';
import 'package:carteiravip/app/modules/pages/login/inicio.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => Inicio()),
        Router('/Principal', child: (_, args) => HomePage()),
        Router('/Login', child: (_, args) => Login()),
        Router('/Cadastro', child: (_, args) => Cadastro()),
        Router('/RecuperarSenha', child: (_, args) => RecuperarSenha()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
