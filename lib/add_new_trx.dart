import 'package:flutter/material.dart';

class AddNewTrx extends StatefulWidget {
  final Function addNewTrxHandler;

  AddNewTrx(this.addNewTrxHandler);

  @override
  State<AddNewTrx> createState() => _AddNewTrxState();
}

class _AddNewTrxState extends State<AddNewTrx> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  void submitData() {
    print("HOHOHOHO");
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addNewTrxHandler(
      enteredTitle,
      enteredAmount,
    );

    // for auto close modal
    Navigator.of(context).pop();
  }

  void hahaha() {
    print("test 123");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val, // shorcut when func just have 1 line
            ),
            ElevatedButton(
              onPressed: submitData, // anonymous function
              child: const Text(
                'Add Transaction',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
