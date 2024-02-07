import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:Education/utill/colors.dart';

class ShowLoader {
  static void loadingHide(context) {
    Navigator.pop(context, true);
  }

  static Future<dynamic> loadingShow(context) {
    return showDialog(
      barrierColor: Colors.transparent,
      context: context,
      barrierDismissible: false,
      builder: (context) {
        double h = MediaQuery.of(context).size.height;
        double w = MediaQuery.of(context).size.width;
        return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            insetPadding: EdgeInsets.all(10),
            elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            child: Center(
              child: Stack(clipBehavior: Clip.none, children: [
                Container(
                    width: 140,
                    height: 140,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                clipBehavior: Clip.none,
                                // padding:EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Column(
                                  children: [
                                    Lottie.asset('assets/loding.json',
                                        width: 80, height: 80),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ]),
            ));
      },
    ).then((exit) {
      if (exit == null) return;
    });
  }

  Dialog loadingWigts(context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: EdgeInsets.all(10),
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
              width: double.infinity,
              // height: 200,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          clipBehavior: Clip.none,

                          width: (MediaQuery.of(context).size.width - 70),
                          // padding:EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: CircularProgressIndicator(
                            color: CC.themePurple,
                            strokeWidth: 5.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ]));
  }
}
