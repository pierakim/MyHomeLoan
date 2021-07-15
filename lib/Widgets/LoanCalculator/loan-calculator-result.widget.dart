import 'package:flutter/material.dart';
import 'package:my_home_loan/Database/loan-calculator-repository.dart';
import 'package:my_home_loan/Routes/router.component.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result-screen-arguments-model.dart';
import 'package:my_home_loan/Widgets/Common/text-display.widget.dart';

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
    final _modelStampDutyResultController = TextEditingController(
        text: this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.stampDutyResult != null
            ? this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.stampDutyResult.toString()
            : null);

    // WIDGET
    return Scaffold(
      // Not sure what to display here. Title or Item or Your item...
      // appBar: AppBar(title: Text(this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel.title)),
      // appBar: AppBar(title: Text("Item")),
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ExpansionTile(
                      leading: Icon(
                        Icons.house_outlined,
                        color: Theme.of(context).accentColor,
                      ),
                      maintainState: true,
                      title: Text(
                        _modelTitleController.text,
                        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
                      ),
                      children: <Widget>[
                        // INFORMATION SUMMARY
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              children: [
                                //STATE ROW
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextDisplayWidget(
                                        icon: Icon(
                                          Icons.home_outlined,
                                          color: Theme.of(context).colorScheme.secondary,
                                          size: 20.0,
                                        ),
                                        controller: _state,
                                        labelText: "State",
                                      ),
                                    )
                                  ],
                                ),
                                // PROPERTY VALUE + DEPOSIT ROW
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextDisplayWidget(
                                        icon: Icon(
                                          Icons.home_outlined,
                                          color: Theme.of(context).colorScheme.secondary,
                                          size: 20.0,
                                        ),
                                        controller: _propertyValue,
                                        labelText: "Property value",
                                        prefixText: "\$",
                                        suffixText: ' AUD',
                                      ),
                                    ),
                                    Expanded(
                                      child: TextDisplayWidget(
                                        icon: Icon(
                                          Icons.home_outlined,
                                          color: Theme.of(context).colorScheme.secondary,
                                          size: 20.0,
                                        ),
                                        controller: _userDeposit,
                                        labelText: "Deposit",
                                        prefixText: "\$",
                                        suffixText: ' AUD',
                                      ),
                                    )
                                  ],
                                ),
                                // LOAN DURATION + BANK INTEREST RATE ROW
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextDisplayWidget(
                                        icon: Icon(
                                          Icons.home_outlined,
                                          color: Theme.of(context).colorScheme.secondary,
                                          size: 20.0,
                                        ),
                                        controller: _loanDuration,
                                        labelText: "Loan duration",
                                        suffixText: ' YEAR(S)',
                                      ),
                                    ),
                                    Expanded(
                                      child: TextDisplayWidget(
                                        icon: Icon(
                                          Icons.home_outlined,
                                          color: Theme.of(context).colorScheme.secondary,
                                          size: 20.0,
                                        ),
                                        controller: _bankInterestRate,
                                        labelText: "Bank interest rate",
                                        suffixText: ' %',
                                      ),
                                    )
                                  ],
                                ),
                                // SOLICITOR FEE + PEST AND BUILDING FEE ROW
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextDisplayWidget(
                                        icon: Icon(
                                          Icons.home_outlined,
                                          color: Theme.of(context).colorScheme.secondary,
                                          size: 20.0,
                                        ),
                                        controller: _solicitorFee,
                                        labelText: "Solicitor fee",
                                        prefixText: "\$",
                                        suffixText: ' AUD',
                                      ),
                                    ),
                                    Expanded(
                                      child: TextDisplayWidget(
                                        icon: Icon(
                                          Icons.home_outlined,
                                          color: Theme.of(context).colorScheme.secondary,
                                          size: 20.0,
                                        ),
                                        controller: _pestAndBuildingFee,
                                        labelText: "Pest and building fee",
                                        prefixText: "\$",
                                        suffixText: ' AUD',
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ),

          // RESULT SUMMARY
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // RESULT DESCRIPTION
                    ListTile(
                      title: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Result',
                                style: TextStyle(fontSize: 15.0, color: Theme.of(context).colorScheme.primary),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.end,
                                //style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                                controller: _modelResultController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  suffixText: ' AUD',
                                  border: InputBorder.none,
                                  filled: false,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        'The addition of value 01 and value 02.',
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                    ListTile(
                      title: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Stamp duty result',
                                style: TextStyle(fontSize: 15.0, color: Theme.of(context).colorScheme.secondary),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.end,
                                // style: TextStyle(fontSize: 15.0),
                                controller: _modelStampDutyResultController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  suffixText: ' AUD',
                                  border: InputBorder.none,
                                  filled: false,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        'What your are going to pay as stamp duty fees.',
                        style: TextStyle(fontSize: 10.0),
                      ),
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
                      var hasBeenSaved =
                          await _loanCalculatorRepo.putLoanCalculatorResult(this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel);
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
              arguments: new LoanCalculatorResultScreenArgumentsModel(this.loanCalculatorResultScreenArgumentsModel.loanCalculatorResultModel, true),
            );
          },
          child: const Icon(Icons.edit),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
