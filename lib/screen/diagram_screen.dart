import 'package:expenditure/bloc/expenditures/expenditures_bloc.dart';
import 'package:expenditure/models/categories.dart';
import 'package:expenditure/models/expenditure.dart';
import 'package:expenditure/widgets/indicator_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PieChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> showingSections() {
      List<PieChartSectionData> diagramArrayWidget = [];

      Map<Categories, double> diagramData = {
        Categories.PERMANENT: 0.0,
        Categories.CLOTH: 0.0,
        Categories.PRODUCT: 0.0,
        Categories.TRANSPORT: 0.0,
        Categories.ENTERTAINMENT: 0.0,
        Categories.CAFE: 0.0,
        Categories.HEALTH: 0.0,
        Categories.FAMILY: 0.0,
        Categories.PRESENTS: 0.0,
        Categories.SAVE: 0.0
      };

      for (Expenditure expend in context.read<ExpenditureBloc>().state) {
        diagramData[expend.categories] =
            diagramData[expend.categories]! + expend.spend;
      }

      for (int i = 0; i < diagramData.length; i++) {
        if (diagramData[Categories.values[i]] != 0.0) {
          final isTouched = i == touchedIndex;
          final fontSize = isTouched ? 25.0 : 16.0;
          final radius = isTouched ? 60.0 : 50.0;
          PieChartSectionData data = PieChartSectionData(
            color: categoriesToColor[diagramData.keys.elementAt(i)],
            value: diagramData[Categories.values[i]],
            title: categoriesToString[diagramData.keys.toList()[i]],
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
          diagramArrayWidget.add(data);
        }
      }
      if (diagramArrayWidget.length == 0) {
        final isTouched = 0 == touchedIndex;
        final fontSize = isTouched ? 25.0 : 16.0;
        final radius = isTouched ? 60.0 : 50.0;
        PieChartSectionData data = PieChartSectionData(
          color: Colors.amberAccent,
          value: 100,
          title: "no",
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
        diagramArrayWidget.add(data);
      }

      return diagramArrayWidget;
    }

    return BlocBuilder<ExpenditureBloc, List<Expenditure>>(
        builder: (context, state) {
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PieChart(
                PieChartData(
                    pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections()),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Color(0xff0293ee),
                  text: 'First',
                  isSquare: true,
                ),
                Indicator(
                  color: Color(0xfff8b250),
                  text: 'Second',
                  isSquare: true,
                ),
                Indicator(
                  color: Color(0xff845bef),
                  text: 'Third',
                  isSquare: true,
                ),
                Indicator(
                  color: Color(0xff13d38e),
                  text: 'Fourth',
                  isSquare: true,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
