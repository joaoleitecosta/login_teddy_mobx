import 'package:login_teddy/app/mixins/loader.mixin.dart';
import 'package:login_teddy/app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'package:login_teddy/app/utils/theme_utils.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with LoaderMixin {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    //showLoader();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => controller.verificaLogado());
  }

  @override
  Widget build(BuildContext context) {
    ThemeUtils.init(context);
    SizeUtils.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
