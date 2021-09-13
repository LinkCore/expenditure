import 'package:expenditure/bloc/expenditures/expenditures_bloc.dart';
import 'package:expenditure/models/categories.dart';
import 'package:expenditure/models/type_expenditure.dart';
import 'package:expenditure/screen/my_home_page.dart';
import 'package:expenditure/widgets/expenditure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/expenditure.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ExpenditureBloc>(
            create: (context) => ExpenditureBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
