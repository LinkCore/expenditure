import 'package:expenditure/models/categories.dart';
import 'package:expenditure/models/expenditure.dart';
import 'package:expenditure/models/type_expenditure.dart';
import 'package:expenditure/screen/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenditureWidget extends StatelessWidget {
  final Expenditure expenditure;

  const ExpenditureWidget({Key? key, required this.expenditure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return EditExpenditureScreen(expenditure: expenditure);
          }));
        },
        child: Container(
          height: 70,
          padding: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Row(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 2),
                  child: Text(
                    "${categoriesToString[expenditure.categories]} ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 2),
                  child: Text(
                    "${expenditureTypeToString[expenditure.expenditureType]} ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 2),
                child: Text(
                  "${expenditure.spend}",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(right: 20),
                child: Text(
                  "${DateFormat('dd / MM / yyyy').format(expenditure.date)}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }
}
