import 'package:flutter/material.dart';

errorSnackBar({required BuildContext context, required String msg}) {
  double screenWidth = MediaQuery.of(context).size.width;

  final snackBar = SnackBar(
    content: Text(msg,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: Colors.white),
        textScaleFactor: 1),
    backgroundColor: Colors.red,
    padding: EdgeInsets.all(15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    behavior: SnackBarBehavior.floating,
    //elevation: 80,
    //width: screenWidth/1.2,
    duration: Duration(seconds: 2),
    margin: EdgeInsets.symmetric(horizontal: 8),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

