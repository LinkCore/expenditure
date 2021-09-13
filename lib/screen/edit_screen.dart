import 'package:expenditure/bloc/expenditures/expenditure_event.dart';
import 'package:expenditure/bloc/expenditures/expenditures_bloc.dart';
import 'package:expenditure/models/expenditure.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditExpenditureScreen extends StatefulWidget {
  final Expenditure expenditure;

  const EditExpenditureScreen({Key? key, required this.expenditure}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditExpenditureScreenState();
  }
}

class _EditExpenditureScreenState extends State<EditExpenditureScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.expenditure.spend.toString());
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
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Color(0xFFff546b),
                    ),
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                          ], // Only numbers can be entered
                        ),
                      ],
                    )
                ),
              ]),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Color(0xFFffe89e),
            onPressed: () {

              context.read<ExpenditureBloc>().add(DeleteExpenditureEvent(widget.expenditure));
              Navigator.of(context).pop();
            },
            child: Icon(Icons.delete),
          ),
         SizedBox(width: 10),
         FloatingActionButton(
            backgroundColor: Color(0xFFffe89e),
            onPressed: () {
              String spendInput = _controller.text;
              double spend = double.parse(spendInput);

              widget.expenditure.spend = spend;

              context.read<ExpenditureBloc>().add(EditExpenditureEvent(widget.expenditure));
              Navigator.of(context).pop();
            },
            child: Icon(Icons.settings_backup_restore),
          ),
        ],
      ),
    );
  }
}