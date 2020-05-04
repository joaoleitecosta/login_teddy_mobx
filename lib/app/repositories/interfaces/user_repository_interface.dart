abstract class IUserReposytory {
  Future<bool> isLogged();
  Future<void> logout();
  Future<String> getToken();
  Future<bool> login(String email, String password);
}
