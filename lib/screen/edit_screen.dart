import 'package:expenditure/bloc/expenditures/expenditure_event.dart';
import 'package:expenditure/bloc/expenditures/expenditures_bloc.dart';
import 'package:expenditure/models/categories.dart';
import 'package:expenditure/models/expenditure.dart';
import 'package:expenditure/models/type_expenditure.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditExpenditureScreen extends StatefulWidget {
  final Expenditure expenditure;

  const EditExpenditureScreen({Key? key, required this.expenditure})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditExpenditureScreenState();
  }
}

class _EditExpenditureScreenState extends State<EditExpenditureScreen> {
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
        child: Text(
            categoryToString[i],
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
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
        child: Text(
        typeToString[i],
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
        ),
      ));
    }
  }

  DateTime? dateExpenditure;

  @override
  void initState() {
    super.initState();
    categoryValue = categoriesToString[widget.expenditure.categories];
    typeValue = expenditureTypeToString[widget.expenditure.expenditureType];
    dateExpenditure = widget.expenditure.date;

    categoryEnumToString();
    categoryDropDownArray();
    typeEnumToString();
    typeDropDownArray();

    _controller =
        TextEditingController(text: widget.expenditure.spend.toString());
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
        title: Text("Edit Screen"),
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
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new TextField(
                        cursorColor: Color(0xFFffe89e),
                        controller: _controller,
                        decoration: new InputDecoration(
                            labelText: "Редактирование суммы:"),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ],
                  )),
              SizedBox(height: 10),
              Container(
                height: 70,
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton<String>(
                  hint: Text("Редактирование категории:"),
                  dropdownColor: Color(0xFF2e2e2e),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
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
                  hint: Text("Редактирование типа:"),
                  dropdownColor: Color(0xFF2e2e2e),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
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
                width: MediaQuery.of(context).size.width,
                height: 40,
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
                        if (date == null) {
                          date = DateTime.now();
                        } else {
                          dateExpenditure = date;
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Row(
                        children: [
                          Text(
                            'Изменить дату:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '${DateFormat('dd / MM / yyyy').format(dateExpenditure!)}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Color(0xFFffe89e),
            onPressed: () {
              context
                  .read<ExpenditureBloc>()
                  .add(DeleteExpenditureEvent(widget.expenditure));
              Navigator.of(context).pop();
            },
            child: Icon(Icons.delete),
          ),
          SizedBox(width: 5),
          FloatingActionButton(
            backgroundColor: Color(0xFFffe89e),
            onPressed: () {
              String spendInput = _controller.text;
              double spend = double.parse(spendInput);

              widget.expenditure.spend = spend;
              widget.expenditure.categories =
                  stringToCategories[categoryValue] as Categories;
              widget.expenditure.expenditureType =
                  expenditureStringToType[typeValue] as ExpenditureType;
              widget.expenditure.date = dateExpenditure as DateTime;

              context
                  .read<ExpenditureBloc>()
                  .add(EditExpenditureEvent(widget.expenditure));
              Navigator.of(context).pop();
            },
            child: Icon(Icons.settings_backup_restore),
          ),
        ],
      ),
    );
  }
}
