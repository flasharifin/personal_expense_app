import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './add_new_trx.dart';
import './transaction_list.dart';
import './model/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 25,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transcation> _userTransaction = [
    // Transcation(
    //   id: 'trx1',
    //   title: 'Top Up Gopay',
    //   amount: 20000,
    //   date: DateTime.now(),
    // ),
    // Transcation(
    //   id: 'trx3',
    //   title: 'Top Up ShoppePay',
    //   amount: 15000,
    //   date: DateTime.now(),
    // ),
    // Transcation(
    //   id: 'trx1',
    //   title: 'Top Up Ovo',
    //   amount: 5000,
    //   date: DateTime.now(),
    // ),
  ];

  void _actionAddNewTrx(String title, double amount) {
    final newTrx = Transcation(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransaction.add(newTrx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return AddNewTrx(_actionAddNewTrx);
        // return GestureDetector(
        //   child: AddNewTrx(_actionAddNewTrx),
        //   onTap: () {},
        // );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense'),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            // userTransaction()
            TransactionList(_userTransaction)
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
