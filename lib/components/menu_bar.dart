import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(44, 51, 51, 1),
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 26,
          bottom: 10,
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "My tasks for the day",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
