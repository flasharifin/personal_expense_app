import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transcation> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No List bro",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              // dynamic list like RecyclerView
              itemBuilder: (ctx, index) {
                return SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 5,
                    shadowColor: Theme.of(context).primaryColor,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1,
                                style: BorderStyle.solid),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Rp ${transactions[index].amount.toStringAsFixed(2)}', // string interpolation same with 'Rp ' + trx.amount.toString() \$ convert symbol to normal string
                            style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(DateFormat.yMMMd()
                                .format(transactions[index].date))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
