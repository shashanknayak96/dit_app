import 'dart:async';

import 'package:flutter/material.dart';
import '../utils/globals.dart';
import '../utils/time_helper.dart';

class MidnightTimer extends StatefulWidget {
  const MidnightTimer({super.key});

  @override
  State<MidnightTimer> createState() => _MidnightTimerState();
}

class _MidnightTimerState extends State<MidnightTimer> {
  String timeLeft = "00:00:00";

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) => getTimeToMidnight(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                right: 20.0,
              ),
              child: Text(
                "TIME LEFT",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20.0,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Globals.borderRadius),
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      timeLeft,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  getTimeToMidnight() {
    var timeNow = DateTime.now();
    var timeToMidnight = TimeHelper.getMidnightTime(timeNow);
    var timeDifference = timeToMidnight.difference(timeNow);

    setState(() {
      timeLeft = printDuration(timeDifference);
      // timeLeft = DateFormat("Hms", 'en_US').format(timeDifference);
    });
  }
}
