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
    final _propertyValue = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.propertyValue != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.propertyValue.toString()
            : null);
    final _userDeposit = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.userDeposit != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.userDeposit.toString()
            : null);
    final _loanDuration = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.loanDuration != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.loanDuration.toString()
            : null);
    final _bankInterestRate = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.bankInterestRate != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.bankInterestRate.toString()
            : null);
    final _solicitorFee = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.solicitorFee != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.solicitorFee.toString()
            : null);
    final _pestAndBuildingFee = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.pestAndBuildingFee != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.pestAndBuildingFee.toString()
            : null);
    final _state = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.state != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.state.toString()
            : null);
    final _modelResultController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.result != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.result.toString()
            : null);

    // WIDGET
    return Scaffold(
      appBar: AppBar(title: Text(this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.title)),
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
                                  color: Theme.of(context).colorScheme.secondary,
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
                                  color: Theme.of(context).colorScheme.secondary,
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
                                  color: Theme.of(context).colorScheme.secondary,
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
                                  Icons.home_outlined,
                                  color: Theme.of(context).colorScheme.secondary,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                                    controller: _propertyValue,
                                    decoration: InputDecoration(
                                      prefixText: "\$",
                                      suffixText: ' AUD',
                                      border: InputBorder.none,
                                      filled: false,
                                      labelText: "Property value",
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
                                  Icons.home_outlined,
                                  color: Theme.of(context).colorScheme.secondary,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                                    controller: _userDeposit,
                                    decoration: InputDecoration(
                                      prefixText: "\$",
                                      suffixText: ' AUD',
                                      border: InputBorder.none,
                                      filled: false,
                                      labelText: "Deposit",
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
                                  Icons.home_outlined,
                                  color: Theme.of(context).colorScheme.secondary,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                                    controller: _loanDuration,
                                    decoration: InputDecoration(
                                      suffixText: ' year(s)',
                                      border: InputBorder.none,
                                      filled: false,
                                      labelText: "Loan duration",
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
                                  Icons.home_outlined,
                                  color: Theme.of(context).colorScheme.secondary,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                                    controller: _bankInterestRate,
                                    decoration: InputDecoration(
                                      suffixText: ' year(s)',
                                      border: InputBorder.none,
                                      filled: false,
                                      labelText: "Bank interesst rate",
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
                                  Icons.home_outlined,
                                  color: Theme.of(context).colorScheme.secondary,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                                    controller: _solicitorFee,
                                    decoration: InputDecoration(
                                      suffixText: 'AUD',
                                      border: InputBorder.none,
                                      filled: false,
                                      labelText: "Solicitor fee",
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
                                  Icons.home_outlined,
                                  color: Theme.of(context).colorScheme.secondary,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                                    controller: _pestAndBuildingFee,
                                    decoration: InputDecoration(
                                      suffixText: 'AUD',
                                      border: InputBorder.none,
                                      filled: false,
                                      labelText: "Pest and building fee",
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
                                  Icons.home_outlined,
                                  color: Theme.of(context).colorScheme.secondary,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                                    controller: _state,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      filled: false,
                                      labelText: "State",
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
                      var hasBeenSaved = await _loanCalculatorRepo.postLoanCalculatorResult(
                          this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel);
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
          // SAVE EXISTING LOAN RESULT - SAVE - SAVED
          else if (this.loanCalculatorResultScreenArgumentsModel.isInEditMode)
            if (!hasResultBeenSaved)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    child: Text('Save changes'),
                    onPressed: () async {
                      // this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.title = _modelTitleController.text;
                      var hasBeenSaved = await _loanCalculatorRepo.putLoanCalculatorResult(
                          this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel);
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
                    child: Text('Changes saved! Go to your collection'),
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
              arguments: new LoanCalculatorResultScreenArgumentsModel(
                  this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel, true),
            );
          },
          child: const Icon(Icons.edit),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
