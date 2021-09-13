import 'package:expenditure/bloc/expenditures/expenditure_event.dart';
import 'package:expenditure/bloc/expenditures/expenditures_bloc.dart';
import 'package:expenditure/models/categories.dart';
import 'package:expenditure/models/expenditure.dart';
import 'package:expenditure/models/type_expenditure.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CreateExpenditureScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateExpenditureScreenState();
  }
}

class _CreateExpenditureScreenState extends State<CreateExpenditureScreen> {
  late TextEditingController _controller;

  String? categoryValue;
  List<Categories> categoryArray = Categories.values;
  List<String> categoryToString = [];
  List<DropdownMenuItem<String>> dropDownCategories = [];

  categoryEnumToString() {
    for (int i = 0; i < categoryArray.length; i++) {
      Categories iCategory = categoryArray[i];
      categoryToString.add(categoriesToString[iCategory] as String);
    }
  }

  categoryDropDownArray() {
    for (int i = 0; i < categoryToString.length; i++) {
      dropDownCategories.add(DropdownMenuItem<String>(
        value: categoryToString[i],
        child: Text(categoryToString[i]),
      ));
    }
  }

  String? typeValue;
  List<ExpenditureType> typeArray = ExpenditureType.values;
  List<String> typeToString = [];
  List<DropdownMenuItem<String>> dropDownType = [];

  typeEnumToString() {
    for (int i = 0; i < typeArray.length; i++) {
      ExpenditureType iType = typeArray[i];
      typeToString.add(expenditureTypeToString[iType] as String);
    }
  }

  typeDropDownArray() {
    for (int i = 0; i < typeToString.length; i++) {
      dropDownType.add(DropdownMenuItem<String>(
        value: typeToString[i],
        child: Text(typeToString[i]),
      ));
    }
  }

  DateTime? dateExpenditure = DateTime.now();

  
  @override
  void initState() {
    super.initState();
    categoryEnumToString();
    categoryDropDownArray();
    typeEnumToString();
    typeDropDownArray();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Expenditure Screen"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                  height: 70,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                      cursorColor: Color(0xFF1f1e1d),
                      controller: _controller,
                      decoration: new InputDecoration(
                        labelText: "Потраченные срества:",
                      ),
                      keyboardType: TextInputType.number)),
              SizedBox(height: 10),
              Container(
                height: 70,
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton<String>(
                  hint: Text("Выберите категорию:"),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  value: categoryValue,
                  onChanged: (newValue) {
                    setState(() {
                      categoryValue = newValue!;
                    });
                  },
                  items: dropDownCategories,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 70,
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton<String>(
                  hint: Text("Выберите тип:"),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  value: typeValue,
                  onChanged: (newValue) {
                    setState(() {
                      typeValue = newValue!;
                    });
                  },
                  items: dropDownType,
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                    onPressed: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025),
                      );
                      setState(() {
                        dateExpenditure = date;
                      });
                    },
                    child: Text(
                      'Выберите день:' '${DateFormat('dd / MM / yyyy').format(dateExpenditure!)}',
                      style: TextStyle(color: Colors.grey),
                    )),
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFffe89e),
        onPressed: () {
          String spendInput = _controller.text;
          double spend = double.parse(spendInput);

          Expenditure expenditure = Expenditure(
              spend: spend,
              date: dateExpenditure as DateTime,
              categories: stringToCategories[categoryValue] as Categories,
              expenditureType:
              expenditureStringToType[typeValue] as ExpenditureType);

          context
              .read<ExpenditureBloc>()
              .add(CreateExpenditureEvent(expenditure));
          Navigator.of(context).pop();
        },
        child: Icon(Icons.assignment_turned_in_outlined),
      ),
    );
  }
}

