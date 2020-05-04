import 'package:login_teddy/app/core/custom_dio.dart';
import 'package:login_teddy/app/repositories/interfaces/user_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserReposytory implements IUserReposytory {
  @override
  Future<bool> login(String email, String password) {
    final dio = CustomDio().instance;

    return dio.post('/auth/signin',
        data: {'email': email, 'password': password}).then((res) async {
      final String token = res.data['tokem'];
      if (token != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString("token", token);
        return true;
      }
      return false;
    });
  }

  @override
  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('tokem');
  }

  @override
  Future<bool> isLogged() async {
    final String token = await this.getToken();
    return token != null;
  }

  @override
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
