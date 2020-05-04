import 'package:get/get.dart';
import 'package:login_teddy/app/mixins/loader.mixin.dart';
import 'package:login_teddy/app/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store, LoaderMixin {
  final UserReposytory _userRepository;

  _HomeControllerBase(this._userRepository);

  Future<void> verificaLogado() async {
    showLoader();

    if (await _userRepository.isLogged()) {
      hideLoader();
    } else {
      hideLoader();
      Get.offAllNamed('/login');
    }
  }
}
