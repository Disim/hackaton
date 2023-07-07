import 'package:flutter/material.dart';
import 'package:hackaton/l10n/all_locales.dart';
import 'package:hackaton/l10n/locale_provider.dart';
import 'package:hackaton/pages/auth/change_password.dart';
import 'package:hackaton/pages/auth/language_page.dart';
import 'package:hackaton/pages/auth/login_page.dart';
import 'package:hackaton/pages/auth/register_page.dart';
import 'package:hackaton/pages/main_page/main_page.dart';
import 'package:hackaton/pages/main_page/object.dart';
import 'package:hackaton/pages/splash_page.dart';
import 'package:hackaton/theme/hackaton_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ChangeNotifierProvider<LocaleProvider>(
        create: (_) => LocaleProvider(),
        builder: (context, child) {
          return MaterialApp(
            theme: CustomTheme.lightTheme,
            supportedLocales: AllLocale.all,
            locale: Provider.of<LocaleProvider>(context).locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            title: 'Хаккатон',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (_) => const SplashPage(),
              '/language_page': (_) => const LanguagePage(),
              '/login_page': (_) => const LoginPage(),
              '/register_page': (_) => const RegisterPage(),
              '/change_password_page': (_) => const ChangePassPage(),
              '/main_page': (_) => const MainPage(),
              '/device_review': (_) => const ViewPage(),
            },
          );
        },
      ),
    );
  }
}
