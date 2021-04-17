import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartExample extends StatefulWidget {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);
  final List<Color> availableColors = [
    Colors.grey,
    Colors.blue,
  ];

  @override
  _BarChartExampleState createState() => _BarChartExampleState();
}

class _BarChartExampleState extends State<BarChartExample> {
  @override

  /// use the [FlTitlesData] to set the titles of the hart for the x axis
  /// the [BarChartGroupData] to customise the rod and assign data to them
  /// the [y] axis of [BarChartRodData] is responsible for handling the current  data and its rrange from 0-10 where 0 is the lowest height of the bar rod and 10 is the highest rod.
  /// use the [gradientColorStops] to customise the gradient way of showing in the bar chart
  ///

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          color: Colors.grey[200],
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      'Line Chart for baba',
                      style: TextStyle(
                          color: const Color(0xff0f4a3c),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'O simple paaa',
                      style: TextStyle(
                          color: const Color(0xff379982),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: BarChart(
                          BarChartData(
                              borderData: FlBorderData(show: false),
                              groupsSpace: 16,
                              alignment: BarChartAlignment.spaceEvenly,
                              titlesData: FlTitlesData(
                                show: true,
                                leftTitles: SideTitles(showTitles: false),
                                bottomTitles: SideTitles(
                                  showTitles: true,
                                  getTextStyles: (value) => const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                  margin: 16,
                                  getTitles: (double value) {
                                    switch (value.toInt()) {
                                      case 0:
                                        return 'M';
                                      case 1:
                                        return 'T';
                                      case 2:
                                        return 'W';
                                      case 3:
                                        return 'T';
                                      case 4:
                                        return 'F';
                                      case 5:
                                        return 'S';
                                      case 6:
                                        return 'S';
                                      default:
                                        return '';
                                    }
                                  },
                                ),
                              ),
                              barGroups: [
                                BarChartGroupData(x: 0, barRods: [
                                  BarChartRodData(
                                      y: 4,
                                      width: 20,
                                      gradientColorStops: [
                                        0.5,
                                        0.5
                                      ],
                                      colors: [
                                        Colors.lightBlue,
                                      ])
                                ]),
                                BarChartGroupData(x: 1, barRods: [
                                  BarChartRodData(
                                      y: 9,
                                      width: 20,
                                      gradientColorStops: [0.5, 0.5],
                                      colors: [Colors.lightBlue])
                                ]),
                                BarChartGroupData(x: 2, barRods: [
                                  BarChartRodData(
                                      y: 9,
                                      width: 20,
                                      gradientColorStops: [0.5, 0.5],
                                      colors: [Colors.lightBlue])
                                ]),
                                BarChartGroupData(x: 3, barRods: [
                                  BarChartRodData(
                                      y: 1,
                                      width: 20,
                                      gradientColorStops: [0.5, 0.5],
                                      colors: [Colors.lightBlue])
                                ]),
                                BarChartGroupData(x: 4, barRods: [
                                  BarChartRodData(
                                      y: 6,
                                      width: 20,
                                      gradientColorStops: [0.5, 0.5],
                                      colors: [Colors.lightBlue])
                                ]),
                                BarChartGroupData(x: 5, barRods: [
                                  BarChartRodData(
                                      y: 3,
                                      width: 20,
                                      gradientColorStops: [0.5, 0.5],
                                      colors: [Colors.lightBlue])
                                ]),
                                BarChartGroupData(x: 6, barRods: [
                                  BarChartRodData(
                                      y: 10,
                                      width: 20,
                                      gradientColorStops: [0.5, 0.5],
                                      colors: [Colors.lightBlue])
                                ]),
                              ]),
                          swapAnimationDuration:
                              Duration(milliseconds: 150), // Optional
                          swapAnimationCurve: Curves.linear,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: widget.availableColors,
          ),
        ),
      ],
    );
  }

  BarChartData randomData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              case 5:
                return 'S';
              case 6:
                return 'S';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(show: false),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 1:
            return makeGroupData(1, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 2:
            return makeGroupData(2, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 3:
            return makeGroupData(3, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 4:
            return makeGroupData(4, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 5:
            return makeGroupData(5, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 6:
            return makeGroupData(6, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          default:
            return null;
        }
      }),
    );
  }
}
