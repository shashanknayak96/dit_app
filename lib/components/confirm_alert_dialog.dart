import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/globals.dart';

class ConfirmAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Icon(
              Icons.delete_forever,
              color: Globals.white,
              size: 36.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              top: 8.0,
              right: 8.0,
            ),
            child: Text(
              'Are you sure you want to delete this task?',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Globals.darkPink,
                    ),
                    onPressed: () => {
                      Navigator.of(context).pop(true),
                    },
                    child: Text(
                      "Confirm",
                      style: TextStyle(color: Globals.darkPurple),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Globals.white,
                    ),
                    onPressed: () => {
                      Navigator.of(context).pop(false),
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Globals.darkPurple),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
