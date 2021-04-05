import 'package:flutter/material.dart';
import 'package:my_home_loan/Database/loan-calculator-repository.dart';
import 'package:my_home_loan/Routes/router.component.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result-screen-arguments-model.dart';

class LoanCalculatorResultWidget extends StatefulWidget {
  static const String routeName = '/readOnlyLoan';

  LoanCalculatorResultWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoanCalculatorResultWidgetState();
}

class _LoanCalculatorResultWidgetState extends State<LoanCalculatorResultWidget> {
  final _loanCalculatorRepo = LoanCalculatorRepository();

  //MAIN STATE: LoanCalculatorResultScreenArgumentsModel
  LoanCalculatorResultScreenArgumentsModel loanCalculatorResultScreenArgumentsModel;

  // STATES
  bool hasResultBeenSaved = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    loanCalculatorResultScreenArgumentsModel = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ROUTE ARGUMENT
    final LoanCalculatorResultScreenArgumentsModel screenArguments = ModalRoute.of(context).settings.arguments;

    setState(() {
      this.loanCalculatorResultScreenArgumentsModel = screenArguments;
    });

    // PARAMETERS TO CONTROLLER
    final _modelIdController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.id != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.id.toString()
            : null);
    final _modelTitleController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.title != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.title.toString()
            : null);
    final _modelValue01Controller = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value01 != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value01.toString()
            : null);
    final _modelValue02Controller = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value02 != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.value02.toString()
            : null);
    final _modelResultController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.result != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.result.toString()
            : null);

    // WIDGET
    return Scaffold(
      appBar: AppBar(title: Text((() {
        if (this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.id == null) {
          return "Your data";
        } else if (this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.id != null) {
          return "Back to collection";
        }
      })())),
      body: ListView(
        children: <Widget>[
          // INFORMATION SUMMARY
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  // TITLE ROW
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Column(
                            children: [
                              Row(children: [
                                Icon(
                                  Icons.description_outlined,
                                  color: Colors.pink,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                                    controller: _modelTitleController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      filled: false,
                                      labelText: "Title",
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        )),
                      ),
                    ],
                  ),
                  // VALUE 01 + VALUE 02 ROW
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Column(
                            children: [
                              Row(children: [
                                Icon(
                                  Icons.attach_money,
                                  color: Colors.pink,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                                    controller: _modelValue01Controller,
                                    decoration: InputDecoration(
                                      prefixText: "\$",
                                      suffixText: ' AUD',
                                      border: InputBorder.none,
                                      filled: false,
                                      labelText: "Value01",
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        )),
                      ),
                      Expanded(
                        child: Card(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Column(
                            children: [
                              Row(children: [
                                Icon(
                                  Icons.not_listed_location_outlined,
                                  color: Colors.pink,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                                    controller: _modelValue02Controller,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      filled: false,
                                      labelText: "Value02",
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // RESULT SUMMARY
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // RESULT DESCRIPTION
                    const ListTile(
                      title: Text('Result'),
                      subtitle: Text('blablabla blabla bla blablabla'),
                    ),
                    // RESULT VALUE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Flexible(
                          child: TextField(
                            textAlign: TextAlign.end,
                            controller: _modelResultController,
                            decoration: InputDecoration(
                              suffixText: ' AUD',
                              border: InputBorder.none,
                              filled: false,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // SAVE NEW LOAN RESULT - SAVE - SAVED
          if (this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.id == null)
            if (!hasResultBeenSaved)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    child: Text('Save'),
                    onPressed: () async {
                      // this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.title = _modelTitleController.text;
                      var hasBeenSaved =
                          await _loanCalculatorRepo.postLoanCalculatorResult(this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel);
                      if (hasBeenSaved) {
                        setState(() => hasBeenSaved == true ? hasResultBeenSaved = true : hasResultBeenSaved = false);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: _modelTitleController.text,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              TextSpan(
                                text: ' saved in your collection',
                              ),
                            ],
                          ),
                        )));
                      }
                    },
                  ),
                ),
              )
            else
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    child: Text('Saved! Go to your collection'),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.myCollectionWidget);
                    },
                  ),
                ),
              )
        ],
      ),
      // FLOATINGACTIONBUTTON CONDITIONAL EDIT LOAN RESULT USING
      floatingActionButton: Visibility(
        visible: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.id == null ? false : true,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              Routes.loanCalculatorWidget,
              arguments: new LoanCalculatorResultScreenArgumentsModel(this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel),
            );
          },
          child: const Icon(Icons.edit),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
