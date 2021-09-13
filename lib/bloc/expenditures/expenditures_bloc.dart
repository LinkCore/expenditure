import 'package:expenditure/bloc/expenditures/expenditure_event.dart';
import 'package:expenditure/models/expenditure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenditureBloc extends Bloc<ExpenditureEvent, List<Expenditure>> {
  ExpenditureBloc() : super([]);

  @override
  Stream<List<Expenditure>> mapEventToState(ExpenditureEvent event) async* {
    if(event is CreateExpenditureEvent){
      List<Expenditure> stateList = List.from(state);
    stateList.add(event.expenditure);
      yield List.from(stateList);
    }

    else if (event is DeleteExpenditureEvent){
      List<Expenditure> stateList = List.from(state);
      stateList.remove(event.expenditure);
      yield List.from(stateList);
    }

    else if (event is EditExpenditureEvent){
      List<Expenditure> stateList = List.from(state);
      stateList.remove(event.expenditure);
      stateList.add(event.expenditure);
      yield List.from(stateList);
    }
  }

}