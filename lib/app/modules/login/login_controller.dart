import 'package:login_teddy/app/repositories/user_repository.dart';
import 'package:login_teddy/app/utils/store_utils.dart';
import 'package:login_teddy/app/core/store_state.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UserReposytory _userReposytory;

  _LoginControllerBase(this._userReposytory);

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  changeEmail(String value) => email = value;

  @action
  changePassword(String value) => password = value;

  @observable
  ObservableFuture<bool> _loginFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_loginFuture);

  @observable
  String errorMessage;

  @observable
  bool loginSuccess;

  @action
  Future<void> requestLogin() async {
    try {
      errorMessage = '';
      loginSuccess = null;
      _loginFuture = ObservableFuture(_userReposytory.login(email, password));
      loginSuccess = await _loginFuture;
    } catch (e) {
      print(e.toString());

      errorMessage = 'eee';
    }
  }
}
