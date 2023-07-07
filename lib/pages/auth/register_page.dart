import 'package:flutter/material.dart';
import 'package:hackaton/elements/alerts.dart';
import 'package:hackaton/elements/body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hackaton/elements/buttons.dart';
import 'package:hackaton/utils/constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retryPassController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(
      loading: loading,
      child: ListView(padding: EdgeInsets.all(marginBig), children: [
        SizedBox(height: marginBig),
        Text(
          'Smart Home',
          style: headline1Montserrat,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: marginBig),
        Text(
          AppLocalizations.of(context)!.registration,
          style: headline1Montserrat,
        ),
        Text(AppLocalizations.of(context)!.registration_text),
        const SizedBox(height: marginHigh),
        TextFormField(
            decoration:
                InputDecoration(labelText: AppLocalizations.of(context)!.login),
            controller: loginController),
        const SizedBox(height: marginHigh),
        TextFormField(
          decoration:
              InputDecoration(labelText: AppLocalizations.of(context)!.email),
          controller: emailController,
        ),
        const SizedBox(height: marginHigh),
        TextFormField(
          decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.create_password),
          controller: passwordController,
        ),
        const SizedBox(height: marginHigh),
        TextFormField(
          decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.repeat_password),
          controller: retryPassController,
        ),
        const SizedBox(height: marginHigh),
        ClassicButton(AppLocalizations.of(context)!.create_account, () async {
          if (emailController.text != '' && loginController.text != '') {
            if (passwordController.text != '' &&
                retryPassController.text == passwordController.text &&
                passwordController.text.length > 6) {
              // await signUp(emailController.text, passwordController.text,
              //     {'login': loginController.text});
            } else {
              alert(context,
                  message: AppLocalizations.of(context)!.alert_empty_password);
            }
          } else {
            alert(context,
                message: AppLocalizations.of(context)!.alert_empty_login_email);
          }
        }),
      ]),
    ));
  }
}
