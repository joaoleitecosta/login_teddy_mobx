import 'package:login_teddy/app/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_teddy/app/modules/login/login_page.dart';
import 'package:login_teddy/app/repositories/interfaces/user_repository_interface.dart';
import 'package:login_teddy/app/repositories/user_repository.dart';
import 'package:login_teddy/app/utils/teddy_controller.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IUserReposytory>((i) => UserReposytory()),
        Bind((i) => LoginController(i.get<IUserReposytory>())),
        Bind((i) => TeddyController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
