import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:internet_connectivity_checker/second_screen.dart';
import 'package:internet_connectivity_checker/widgets/button.dart';
import 'package:internet_connectivity_checker/widgets/snackbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String status = " ";
  bool deviceConnected = false;
  late StreamSubscription subscription;

  void initState() {



    checkConnectivity();

    subscription = Connectivity().onConnectivityChanged.listen((result) async {

      deviceConnected = await InternetConnectionChecker().hasConnection;

      if(result == ConnectivityResult.none && deviceConnected == false) {

        print('No Connection');

      }

      else if ((result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) && deviceConnected == true) {
        print('Available');
      }
    });

    super.initState();
  }

  Future<void> checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();

    if(result == ConnectivityResult.none) {
      setState(() {
        status = "No Connection";
      });
    }
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,

      body:
      Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              buttonText: 'Next Screen',
              width: 200, height: 60,
              color: Colors.black, backGroundColor: Colors.green,
              onPressed: () async {

                if(deviceConnected == false) {

                  errorSnackBar(context: context, msg: 'No Internet Connection');
                } else if(deviceConnected == true) {

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SecondScreen()));
                }

              },


            ),
          ],
        ),
      ),
    );
  }
}

