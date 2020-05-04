import 'package:login_teddy/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_teddy/app/modules/home/home_page.dart';
import 'package:login_teddy/app/modules/login/login_module.dart';
import 'package:login_teddy/app/repositories/interfaces/user_repository_interface.dart';
import 'package:login_teddy/app/repositories/user_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IUserReposytory>((i) => UserReposytory()),
        Bind((i) => HomeController(i.get<IUserReposytory>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/login', module: LoginModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
