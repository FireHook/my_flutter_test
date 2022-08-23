import 'package:flutter/material.dart';
import 'package:my_flutter_test/widgets/chart.dart';
import 'package:my_flutter_test/widgets/new_transaction.dart';
import 'package:my_flutter_test/widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatefulWidget {
  ExpensesApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExpensesAppState();
  }
}

class _ExpensesAppState extends State<ExpensesApp> {

  void _addNewTransaction(String title, double price, DateTime date) {
    final transaction = Transaction(
        id: DateTime.now().toString(), title: title, price: price, date: date);

    setState(() {
      _transactions.add(transaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  void _showAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(addTransaction: _addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  final _transactions = [
    Transaction(
        id: DateTime.now().toString(),
        title: 'New Shoes',
        price: 86.99,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: 'Groceries',
        price: 12.37,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.amber
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Expenses App'),
            actions: [
              IconButton(
                  onPressed: () => _showAddNewTransaction(context),
                  icon: Icon(Icons.add)),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Chart(transactions: _transactions),
                TransactionList(
                  transactions: _transactions,
                  deleteTransaction: _deleteTransaction,
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _showAddNewTransaction(context),
          ),
        ),
    );
  }
}
