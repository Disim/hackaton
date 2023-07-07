import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box<dynamic> box;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool first = true;

  Future<void> checkLogin() async {
    // await Hive.initFlutter();
    // Box<dynamic> box = await Hive.openBox('login');
    // if (box.containsKey('accessToken') && box.containsKey('refreshToken')) {
    //   user.accessToken = box.get('accessToken');
    //   user.refreshToken = box.get('refreshToken');
    //   await user.getProfile();
    //   // if (updater.myId == -1) {
    //   //   box.clear();
    //   //   Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    //   // } else {
    //   //   Navigator.pushNamedAndRemoveUntil(
    //   //       context, '/objects', (route) => false);
    //   // }
    //   // } else {
    //   //   Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    // }
    // box.close();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Navigator.pushNamedAndRemoveUntil(
            context, '/language_page', (route) => false));
  }

  @override
  void initState() {
    super.initState();
    if (first) {
      first = false;
      checkLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
