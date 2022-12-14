import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {

  final List<Transaction> transactions;

  const Chart({
    Key? key,
    required this.transactions
  }) : super(key: key);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index)
      );

      var totalSum = 0.0;

      for(var i = 0; i < transactions.length; i++) {
        if(transactions[i].date.day == weekDay.day &&
        transactions[i].date.month == weekDay.month &&
        transactions[i].date.year == weekDay.year) {
          totalSum += transactions[i].price;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get maxSpending {
    return groupedTransaction.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: groupedTransaction.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'].toString(),
                spending: (data['amount'] as double),
                percentage: (data['amount'] as double) / maxSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
