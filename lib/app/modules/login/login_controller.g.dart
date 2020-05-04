// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_LoginControllerBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$_loginFutureAtom = Atom(name: '_LoginControllerBase._loginFuture');

  @override
  ObservableFuture<bool> get _loginFuture {
    _$_loginFutureAtom.context.enforceReadPolicy(_$_loginFutureAtom);
    _$_loginFutureAtom.reportObserved();
    return super._loginFuture;
  }

  @override
  set _loginFuture(ObservableFuture<bool> value) {
    _$_loginFutureAtom.context.conditionallyRunInAction(() {
      super._loginFuture = value;
      _$_loginFutureAtom.reportChanged();
    }, _$_loginFutureAtom, name: '${_$_loginFutureAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_LoginControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$loginSuccessAtom = Atom(name: '_LoginControllerBase.loginSuccess');

  @override
  bool get loginSuccess {
    _$loginSuccessAtom.context.enforceReadPolicy(_$loginSuccessAtom);
    _$loginSuccessAtom.reportObserved();
    return super.loginSuccess;
  }

  @override
  set loginSuccess(bool value) {
    _$loginSuccessAtom.context.conditionallyRunInAction(() {
      super.loginSuccess = value;
      _$loginSuccessAtom.reportChanged();
    }, _$loginSuccessAtom, name: '${_$loginSuccessAtom.name}_set');
  }

  final _$requestLoginAsyncAction = AsyncAction('requestLogin');

  @override
  Future<void> requestLogin() {
    return _$requestLoginAsyncAction.run(() => super.requestLogin());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.changeEmail(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.changePassword(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},password: ${password.toString()},errorMessage: ${errorMessage.toString()},loginSuccess: ${loginSuccess.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
