import 'package:flutter/material.dart';

class AddNewTrx extends StatelessWidget {
  final Function addNewTrxHandler;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  AddNewTrx(this.addNewTrxHandler);

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
                addNewTrxHandler(titleController.text, double.parse(amountController.text));
              }, // anonymous function
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
