import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function? onPressed;
  final String buttonText;
  final double width;
  final double height;
  final Color color;
  final Color backGroundColor;


  const Button({
    Key? key,
    this.onPressed,
    required this.buttonText,
    required this.width,
    required this.height,
    required this.color,
    required this.backGroundColor,

  }) : super(key: key);

  //A Single button widget which can be used throughout the app

  @override
  Widget build(BuildContext context,) {

    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backGroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          textScaleFactor: 1.1,
          style: Theme.of(context).textTheme.button
          //GoogleFonts.poppins(color: Color(0xff0e0e10),fontSize: 16,fontWeight: FontWeight.w500)
          ,
        ),
        onPressed: () => onPressed!(),
      ),
    );
  }
}