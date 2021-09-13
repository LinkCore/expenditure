import 'package:expenditure/models/type_expenditure.dart';
import 'categories.dart';

class Expenditure{
  double? spend;
  DateTime date;
  Categories categories;
  ExpenditureType expenditureType;

  Expenditure({this.spend, required this.date, required this.categories, required this.expenditureType});
}