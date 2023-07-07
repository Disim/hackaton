import 'package:flutter/material.dart';
import 'package:hackaton/elements/body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hackaton/elements/buttons.dart';
import 'package:hackaton/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(
      child: ListView(padding: const EdgeInsets.all(60), children: [
        SizedBox(height: marginBig),
        Text(
          'Smart Home',
          style: headline1Montserrat,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: marginBig),
        Text(AppLocalizations.of(context)!.login_authorization,
            style: headline1Montserrat),
        Text(AppLocalizations.of(context)!.login_greeting),
        const SizedBox(height: marginHigh),
        TextFormField(
          decoration:
              InputDecoration(labelText: AppLocalizations.of(context)!.email),
        ),
        const SizedBox(height: marginHigh),
        TextFormField(
          decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.password),
        ),
        const SizedBox(height: marginHigh),
        ClassicButton(AppLocalizations.of(context)!.enter, () {
          Navigator.pushNamed(context, '/main_page');
        }),
        const SizedBox(height: marginHigh),
        TextButton(
            child: Text(AppLocalizations.of(context)!.forgot_password),
            onPressed: () {
              Navigator.pushNamed(context, '/change_password_page');
            }),
        const SizedBox(height: marginHigh),
        InlineButton(AppLocalizations.of(context)!.create_account, () {
          // signIn(emailController.text, passController.text);
          Navigator.pushNamed(context, '/register_page');
        }),
      ]),
    ));
  }
}
