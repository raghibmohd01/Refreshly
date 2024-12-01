import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer _timer;
  int oldTick = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      print('timer complete ${timer.tick}');
      setState(() {
        oldTick = _timer.tick;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('${_timer.tick}');

    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 30, spreadRadius: 5)
            ]),
        child: Center(
            child: Expanded(
                child: Text(
          oldTick.toString(),
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ))),
      ),
    );
  }
}
