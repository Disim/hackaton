import 'package:flutter/material.dart';
import 'package:hackaton/elements/buttons.dart';
import 'package:hackaton/utils/constants.dart';

alert(BuildContext context,
    {String title = 'Произошла ошибка', String message = ''}) {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Container(
              padding: EdgeInsets.all(margin),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: headline1Montserrat),
                  SizedBox(
                    height: margin,
                  ),
                  Text(
                    message,
                    style: headline1Montserrat.copyWith(
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: margin,
                  ),
                  ClassicButton('Понятно', () => Navigator.pop(context, false))
                ],
              )),
        );
      });
}
