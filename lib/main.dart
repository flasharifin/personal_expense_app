import 'package:flutter/material.dart';
import './model/transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

// String? titleInput;
// String? amountInput;

final TextEditingController titleController = TextEditingController();
final TextEditingController amountController = TextEditingController();

class MyHomePage extends StatelessWidget {
  List<Transcation> transactions = [
    Transcation(
      id: 'trx1',
      title: 'Top Up Gopay',
      amount: 20000,
      date: DateTime.now(),
    ),
    Transcation(
      id: 'trx3',
      title: 'Top Up ShoppePay',
      amount: 15000,
      date: DateTime.now(),
    ),
    Transcation(
      id: 'trx1',
      title: 'Top Up Ovo',
      amount: 5000,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: 30,
            child: const Card(
              color: Colors.yellow,
              elevation: 5,
              child: Text(
                'Card 1',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                  ),
                  TextField( 
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    // onChanged: (val) => amountInput = val, // shorcut when func just have 1 line
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(titleController.text);
                      print(amountController.text);
                    }, // anonymous function
                    child: const Text(
                      'Add Transaction',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((trx) {
              return SizedBox(
                width: double.infinity,
                child: Card(
                    elevation: 5,
                    shadowColor: Colors.redAccent,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Rp ${trx.amount}', // string interpolation same with 'Rp ' + trx.amount.toString() \$ convert symbol to normal string
                            style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              trx.title,
                              style: const TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(DateFormat.yMMMd().format(trx.date))
                          ],
                        )
                      ],
                    )),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
