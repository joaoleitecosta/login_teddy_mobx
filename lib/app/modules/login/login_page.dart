import 'package:email_validator/email_validator.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:login_teddy/app/core/store_state.dart';
import 'package:login_teddy/app/modules/login/components/signin_button.dart';
import 'package:login_teddy/app/modules/login/components/tracking_text_input.dart';
import 'package:login_teddy/app/modules/login/login_module.dart';
import 'package:login_teddy/app/utils/teddy_controller.dart';
import 'package:mobx/mobx.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  TeddyController _teddyController = LoginModule.to.get();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode focusEmail;
  FocusNode focusPassword;
  bool loading = false;

  List<ReactionDisposer> _disposer;

  @override
  void initState() {
    super.initState();
    focusEmail = FocusNode();
    focusPassword = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _disposer.forEach((d) => d());
    focusEmail.dispose();
    focusPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
            child: Stack(
          children: <Widget>[_background(), _body()],
        )));
  }

  Widget _background() {
    return Positioned(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
              0.0,
              1.0
            ],
                colors: [
              Color.fromRGBO(170, 207, 211, 1.0),
              Color.fromRGBO(93, 142, 155, 1.0),
            ])),
      ),
    );
  }

  Widget _teddy() {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 30.00),
      child: FlareActor(
        'assets/Teddy.flr',
        shouldClip: false,
        alignment: Alignment.bottomCenter,
        fit: BoxFit.contain,
        controller: _teddyController,
      ),
    );
  }

  Widget _body() {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Positioned(
      child: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: 20.0, right: 20.0, top: devicePadding.top + 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[_teddy(), _form()],
          )),
    );
  }

  Widget _form() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TrackingTextInput(
                label: 'Email',
                focus: focusEmail,
                autoFocus: true,
                hint: 'Digite seu email aqui',
                onCaretMoved: (Offset caret) => _teddyController.lookAt(caret),
                onTextChanged: (value) => controller.changeEmail(value),
              ),
              TrackingTextInput(
                label: 'Password',
                focus: focusPassword,
                hint: 'Digite sua senha aqui',
                isObscured: true,
                onCaretMoved: (Offset caret) {
                  _teddyController.coverEyes(caret != null);
                  _teddyController.lookAt(null);
                },
                onTextChanged: (value) => controller.changePassword(value),
              ),
              SigninButton(
                onPressed: _login,
                child: loading
                    ? CircularProgressIndicator()
                    : Text('Entrar',
                        style: TextStyle(
                            fontFamily: "RobotoMedium",
                            fontSize: 16,
                            color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }

  _login() {
    if (!EmailValidator.validate(controller.email)) {
      focusEmail.requestFocus();
      _snackBarError(title: 'Error', error: 'Digite um email válido');
    } else if (controller.password.length < 6) {
      focusPassword.requestFocus();
      _snackBarError(title: 'Error', error: 'Digite uma senha válida');
    } else {
      focusPassword.nextFocus();
      setState(() {
        loading = true;
      });

      Future.delayed(Duration(seconds: 2), () {
        controller.requestLogin();
        controller.changePassword("");
        _disposer ??= [
          reaction((_) => controller.state, (StoreState state) {
            if (state == StoreState.loading) {
              _teddyController.play("hands_down");
            } else if (state == StoreState.loaded) {}
          }),
          reaction((_) => controller.loginSuccess, (sucess) {
            _teddyController.play("success");
            _snackBarSucess();
            Future.delayed(Duration(seconds: 3), () {
              Get.offAllNamed('/');
            });
          }),
          reaction((_) => controller.errorMessage, (String errorMessage) {
            if (errorMessage.isNotEmpty) {
              _teddyController.play("fail");
              setState(() {
                loading = false;
              });

              _snackBarError(
                  title: 'Erro ao realizar Login', error: errorMessage);
            }
          })
        ];
      });
    }
  }

  _snackBarError({@required String title, @required String error}) {
    return Get.snackbar(title, error,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(milliseconds: 2500));
  }

  _snackBarSucess() {
    return Get.snackbar('Sucesso', 'Login realizado com sucesso',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(milliseconds: 2500));
  }
}
