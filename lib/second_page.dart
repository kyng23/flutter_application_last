import 'package:flutter/material.dart';
import 'package:flutter_application_last/presentation.dart';

class SecondPage extends StatefulWidget {
  List dataseriesforThisClass;
  SecondPage({super.key, required this.dataseriesforThisClass});

  @override
  State<SecondPage> createState() => _SecondPageState(dataseriesforThisClass);
}

class _SecondPageState extends State<SecondPage> {
  List dataseriesforSecondPage;
  _SecondPageState(this.dataseriesforSecondPage);
  Widget buildPages(int hour) {
    return Container(
      child: Column(children: [
        Text(hour.toString()),
        Text(dataseriesforSecondPage[hour].toString())
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("data")),
        body: PageView(
          children: [for (int i = 0; i < 24; i++) (buildPages(i))],
        ));
  }
}
