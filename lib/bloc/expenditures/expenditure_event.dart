import 'package:expenditure/models/expenditure.dart';

class ExpenditureEvent{}

class CreateExpenditureEvent extends ExpenditureEvent{
  final Expenditure expenditure;

  CreateExpenditureEvent(this.expenditure);
}

class DeleteExpenditureEvent extends ExpenditureEvent{
  final Expenditure expenditure;

  DeleteExpenditureEvent(this.expenditure);
}

class EditExpenditureEvent extends ExpenditureEvent{
  final Expenditure expenditure;

  EditExpenditureEvent(this.expenditure);
}