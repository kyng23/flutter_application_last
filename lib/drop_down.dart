import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_application_last/presentation.dart';
import 'package:flutter_application_last/second_page.dart';

class DropDown extends StatefulWidget {
  List dataseriesForThisClass;
  DropDown({super.key, required this.dataseriesForThisClass});

  @override
  State<DropDown> createState() => _DropDownState(dataseriesForThisClass);
}

class _DropDownState extends State<DropDown> {
  List dataseriesForDropDownState;
  _DropDownState(this.dataseriesForDropDownState);

  String valueChoose = "temp2m";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
            value: valueChoose,
            items: const [
              DropdownMenuItem(value: "cloudcover", child: Text("cloudcover")),
              DropdownMenuItem(value: "seeing", child: Text("seeing")),
              DropdownMenuItem(
                  value: "transparency", child: Text("transparency")),
              DropdownMenuItem(
                  value: "lifted_index", child: Text("lifted_index")),
              DropdownMenuItem(value: "rh2m", child: Text("rh2m")),
              DropdownMenuItem(value: "temp2m", child: Text("temp2m")),
            ],
            onChanged: (newValue) {
              setState(() {
                valueChoose = newValue.toString();
              });
            }),
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SecondPage(
                        dataseriesforThisClass: dataseriesForDropDownState,
                      ))),
          child: Container(
            color: Colors.red,
            width: 365.0,
            height: 255.0,
            child: LineChart(
              LineChartData(
                  minX: 0,
                  maxX: 24,
                  minY: -40,
                  maxY: 50,
                  lineBarsData: [
                    LineChartBarData(spots: [
                      for (int i = 0; i < 23; i++)
                        (FlSpot(i.toDouble(),
                            dataseriesForDropDownState[i][valueChoose] + 0.0))
                    ])
                  ]),
            ),
          ),
        ),
        const Text(
          "Click empty red area in order to see the hourly data in detail ",
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
