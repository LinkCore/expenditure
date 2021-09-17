import 'package:expenditure/bloc/expenditures/expenditures_bloc.dart';
import 'package:expenditure/models/expenditure.dart';
import 'package:expenditure/widgets/expenditure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_expenditure_screen.dart';

class ExpenditureWidgetScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Expenditure Screen")),
      body: BlocBuilder<ExpenditureBloc, List<Expenditure>>(
        builder: (context, state) {
          List<ExpenditureWidget> expenditureWidgetArray = [];
          for(Expenditure exp in state){
            expenditureWidgetArray.add(ExpenditureWidget(expenditure: exp));
          }
          return SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
              expenditureWidgetArray
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFffe89e),
        onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return CreateExpenditureScreen();
            }));
            //expenditureArray.add(expenditure);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
