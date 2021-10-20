import 'package:flutter/material.dart';
import 'widgets/body/login_body.dart';
import 'widgets/login_header.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              LoginHeader(),
              LoginBody(),
            ],
          ),
        ),
      ),
    );
  }
}
