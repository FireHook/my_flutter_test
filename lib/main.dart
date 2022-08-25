import 'package:flutter/material.dart';
import 'package:my_flutter_test/widgets/chart.dart';
import 'package:my_flutter_test/widgets/new_transaction.dart';
import 'package:my_flutter_test/widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    final appBar = AppBar(
      title: Text('Expenses App'),
      actions: [
        IconButton(
            onPressed: () => _showAddNewTransaction(context),
            icon: Icon(Icons.add)),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(transactions: _transactions)),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.7,
              child: TransactionList(
                transactions: _transactions,
                deleteTransaction: _deleteTransaction,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddNewTransaction(context),
      ),
    );
  }
}
