import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hackaton/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({this.child = const SizedBox(), this.loading = false, super.key});
  final Widget child;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [child, LoadingScreen(loading: loading)],
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({this.loading = false, Key? key}) : super(key: key);
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: loading,
      child: Container(
        //Если не задать цвет, то объекты находящиеся
        //за загрузочным окном остаются кликабельными
        color: const Color.fromARGB(0, 255, 255, 255),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: const Center(child: CircularProgressIndicator(color: mainColor)),
        ),
      ),
    );
  }
}
