import 'package:flutter/material.dart';
import 'package:hackaton/elements/body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hackaton/elements/buttons.dart';
import 'package:hackaton/l10n/all_locales.dart';
import 'package:hackaton/l10n/locale_provider.dart';
import 'package:hackaton/utils/constants.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

int language = 1;

class _LanguagePageState extends State<LanguagePage> {
  Widget radioButton(final int myNum, final String name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          language = myNum;
          Provider.of<LocaleProvider>(context, listen: false)
              .setLocale(AllLocale.all[myNum]);
        });
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: mediumRad,
            border: Border.all(
                color: (myNum == language ? mainColor : borderColor))),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(
            child: ListView(
      padding: EdgeInsets.all(marginBig),
      children: [
        SizedBox(height: marginBig),
        Text(
          'Smart Home',
          style: headline1Montserrat,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: marginBig),
        Text(
          AppLocalizations.of(context)!.select_language,
          style: headline1Montserrat,
        ),
        Text(AppLocalizations.of(context)!.choose_language),
        const SizedBox(height: marginHigh),
        radioButton(0, 'English'),
        const SizedBox(height: marginHigh),
        radioButton(1, 'Русский'),
        const SizedBox(height: marginHigh),
        radioButton(2, '中文'),
        const SizedBox(height: marginHigh),
        ClassicButton(AppLocalizations.of(context)!.continues, () {
          Navigator.pushNamed(context, '/login_page');
        }),
      ],
    )));
  }
}
