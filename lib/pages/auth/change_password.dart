import 'package:flutter/material.dart';
import 'package:hackaton/elements/body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hackaton/elements/buttons.dart';
import 'package:hackaton/utils/constants.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({super.key});

  @override
  State<ChangePassPage> createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(
      child: ListView(padding: EdgeInsets.all(marginBig), children: [
        SizedBox(height: marginBig),
        Text(
          'Smart Home',
          style: headline1Montserrat,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: marginBig),
        Text(
          AppLocalizations.of(context)!.password_recovery,
          style: headline1Montserrat,
        ),
        Text(AppLocalizations.of(context)!.enter_email),
        const SizedBox(height: marginHigh),
        TextFormField(
          decoration:
              InputDecoration(labelText: AppLocalizations.of(context)!.login),
        ),
        const SizedBox(height: marginHigh),
        ClassicButton(AppLocalizations.of(context)!.reset_password, () {}),
      ]),
    ));
  }
}
