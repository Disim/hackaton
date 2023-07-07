import 'package:flutter/material.dart';
import 'package:hackaton/utils/constants.dart';

class ClassicButton extends StatelessWidget {
  const ClassicButton(
    this.text,
    this.onTap, {
    this.height = 40,
    this.radius = 10,
    this.fontSize = 20,
    this.menuMode = false,
    super.key,
  });

  // height: 40,
  //       radius: 10,
  //       fontSize: 20,

  final String text;
  final Function? onTap;
  final double height;
  final double radius;
  final double fontSize;
  final bool menuMode;

  final double mHeight = 80;
  final double mRadius = 20;
  final double mFontSize = 24;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: menuMode ? mHeight : height,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(mainColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(menuMode ? mRadius : radius)))),
          onPressed: () {
            onTap != null ? onTap!() : Function;
          },
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: menuMode ? mFontSize : fontSize,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}

class InlineButton extends StatelessWidget {
  const InlineButton(
    this.text,
    this.onTap, {
    this.height = 40,
    this.radius = 10,
    this.fontSize = 20,
    this.color = mainColor,
    super.key,
  });

  final String text;
  final Function? onTap;
  final double height;
  final double radius;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: OutlinedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius)))),
          onPressed: () {
            onTap != null ? onTap!() : Function;
          },
          child: Text(
            text,
            style: TextStyle(
                color: color, fontSize: fontSize, fontWeight: FontWeight.bold),
          )),
    );
  }
}

class AddImageButton extends StatelessWidget {
  const AddImageButton(this.onTap, {super.key});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: margin),
      child: InkWell(
        borderRadius: mediumRad,
        onTap: () {
          onTap();
        },
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: mediumRad,
              border: Border.all(color: borderColor)),
          child: const Center(child: Icon(Icons.attach_file)),
        ),
      ),
    );
  }
}
