import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      HomeScreenState();
}

class HomeScreenState
    extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros =
            totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration =
        Duration(seconds: seconds);
    // print(duration
    //     .toString()
    //     .split(".")
    //     .first
    //     .substring(2, 7)
    //     );
    return duration
        .toString()
        .split(".")
        .first
        .substring(2, 7);
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = twentyFiveMinutes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context)
          .scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment:
                  Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context)
                      .cardColor,
                  fontSize: 89,
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
            ),
          ),
          // Flexible(
          //   flex: 3,
          //   child: Center(
          //     child: IconButton(
          //       color: Theme.of(context)
          //           .cardColor,
          //       onPressed: isRunning
          //           ? onPausePressed
          //           : onStartPressed,
          //       icon: Icon(isRunning
          //           ? Icons
          //               .pause_circle_outline
          //           : Icons
          //               .play_circle_outline),
          //       iconSize: 120,
          //     ),
          //   ),
          // ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment
                      .center,
              children: [
                IconButton(
                  color: Theme.of(context)
                      .cardColor,
                  onPressed: isRunning
                      ? onPausePressed
                      : onStartPressed,
                  icon: Icon(isRunning
                      ? Icons
                          .pause_circle_outline
                      : Icons
                          .play_circle_outline),
                  iconSize: 120,
                ),
                TextButton(
                  onPressed:
                      onResetPressed,
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      color: Theme.of(
                              context)
                          .cardColor,
                      fontSize: 20,
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration:
                        BoxDecoration(
                      color: Theme.of(
                              context)
                          .cardColor,
                      borderRadius:
                          const BorderRadius
                              .only(
                        topLeft: Radius
                            .circular(20),
                        topRight: Radius
                            .circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                      children: [
                        Text(
                          'Pomodoro',
                          style:
                              TextStyle(
                            fontSize: 20,
                            fontWeight:
                                FontWeight
                                    .w600,
                            color: Theme.of(
                                    context)
                                .textTheme
                                .headlineLarge
                                ?.color,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style:
                              TextStyle(
                            fontSize: 50,
                            fontWeight:
                                FontWeight
                                    .w600,
                            color: Theme.of(
                                    context)
                                .textTheme
                                .headlineLarge
                                ?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
