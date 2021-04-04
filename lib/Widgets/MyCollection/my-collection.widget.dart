import 'package:flutter/material.dart';
import 'package:my_home_loan/Database/loan-calculator-repository.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result.model.dart';
import 'package:my_home_loan/Routes/router.component.dart';
import 'package:my_home_loan/Widgets/Common/card-information.widget.dart';
import 'package:my_home_loan/Models/LoanCalculator/loan-calculator-result-screen-arguments-model.dart';

import '../app-drawer.widget.dart';

class MyCollectionWidget extends StatefulWidget {
  static const String routeName = '/myCollection';

  @override
  _MyCollectionWidgetState createState() => _MyCollectionWidgetState();
}

class _MyCollectionWidgetState extends State<MyCollectionWidget> {
  Future<List<LoanCalculatorResultModel>> _paymentCalculatorResults;
  final _loanCalculatorRepo = LoanCalculatorRepository();

  @override
  void initState() {
    super.initState();
    _paymentCalculatorResults = _loanCalculatorRepo.getAllLoanCalculatorResults();
  }

  // REFRESH LIST - REFRESH STATE BASED ON DB RESULT
  void refreshList() {
    setState(() {
      _paymentCalculatorResults = _loanCalculatorRepo.getAllLoanCalculatorResults();
    });
  }

  // ON TAP - DELETE
  void deleteSelected(int rowId) async {
    await _loanCalculatorRepo.deleteLoanCalculatorResult(rowId);
    refreshList();
  }

  // ON TAP - FAVOURITE
  void favouriteSelected(LoanCalculatorResultModel paymentCalculatorResult) async {
    await _loanCalculatorRepo.putLoanCalculatorResult(paymentCalculatorResult);
    refreshList();
  }

  // WIDGET
  @override
  Widget build(BuildContext context) {
    return mainScreen(context);
  }

  // MAIN COLLECTION SCREEN
  Widget mainScreen(BuildContext ctx) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("My Collection"),
      ),
      drawer: AppDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CardInformationWidget(
                icon: Icon(Icons.home, color: Theme.of(context).accentColor),
                title: "Your saved collection",
                description: "Your collection",
              ),
              FutureBuilder<List<LoanCalculatorResultModel>>(
                  future: _paymentCalculatorResults,
                  builder: (BuildContext context, AsyncSnapshot<List<LoanCalculatorResultModel>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(height: MediaQuery.of(context).size.width, child: Center(child: CircularProgressIndicator()));
                    } else {
                      if (snapshot.hasError)
                        return SizedBox(
                            height: MediaQuery.of(context).size.width,
                            child: Center(child: Text('Ouups, something happened..please restart the app')));
                      else if (snapshot.data.length == 0)
                        return SizedBox(height: MediaQuery.of(context).size.width, child: Center(child: Text('Collection is empty')));
                      else
                        return Card(child: tableBody(context, snapshot.data));
                    }
                  })
            ],
          ),
        ),
      ),
      // ADD NEW - FLOATING + BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(
            context,
            Routes.loanCalculatorWidget,
            arguments: new LoanCalculatorResultScreenArgumentsModel(null),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  // TABLE DATA COLUMN - LIST OF LoanCalculatorResultModel
  SingleChildScrollView tableBody(BuildContext ctx, List<LoanCalculatorResultModel> paymentCalculatorResults) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FittedBox(
        child: DataTable(
          showCheckboxColumn: false,
          // columnSpacing: 20,
          dataRowHeight: 75,
          dividerThickness: 1,
          headingRowHeight: 0,
          columns: [
            DataColumn(
              label: Text(""),
            ),
            DataColumn(
              label: Text(""),
            ),
            DataColumn(
              label: Text(""),
            ),
            DataColumn(
              label: Text(""),
            ),
          ],
          rows: paymentCalculatorResults
              .map(
                (paymentCalculatorResult) => DataRow(
                    onSelectChanged: (bool selected) {
                      if (selected) {
                        print('row id: ' + paymentCalculatorResult.id.toString());
                        Navigator.pushNamed(
                          context,
                          Routes.loanCalculatorResultWidget,
                          arguments: new LoanCalculatorResultScreenArgumentsModel(new LoanCalculatorResultModel(
                              paymentCalculatorResult.id,
                              paymentCalculatorResult.title,
                              paymentCalculatorResult.value01,
                              paymentCalculatorResult.value02,
                              paymentCalculatorResult.isFavourite,
                              paymentCalculatorResult.creationDate,
                              paymentCalculatorResult.modificationDate)),
                        );
                      }
                    },
                    cells: [
                      // FAVOURITE
                      DataCell(GestureDetector(
                          onTap: () {
                            favouriteSelected(paymentCalculatorResult);
                          },
                          child: paymentCalculatorResult.isFavourite == 0
                              ? Icon(Icons.favorite_border_outlined, size: 30)
                              : Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                ))),
                      // EDIT
                      DataCell(GestureDetector(
                          onTap: () {
                            //editSelected(paymentCalculatorResult.id);
                          },
                          child: Icon(Icons.edit_outlined, size: 30))),
                      // DESCRIPTION/TITLE
                      DataCell(
                        Container(
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  // width: 150,
                                  child: Text(paymentCalculatorResult.title,
                                      style: new TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  // width: 150,
                                  child: Text(
                                      "Value 01: " +
                                          paymentCalculatorResult.value01.toString() +
                                          "  " +
                                          "Value 02: " +
                                          paymentCalculatorResult.value02.toString(),
                                      style: new TextStyle(
                                        fontSize: 15.0,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // DELETE
                      DataCell(GestureDetector(
                          onTap: () {
                            deleteSelected(paymentCalculatorResult.id);
                          },
                          child: Icon(
                            Icons.delete_outlined,
                            size: 30,
                          ))),
                    ]),
              )
              .toList(),
        ),
      ),
    );
  }
}
