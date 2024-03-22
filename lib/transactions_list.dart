import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/addTransaction.dart';

class transactions_list extends StatelessWidget {
  transactions_list({super.key});

  add_transactions Trans_object = add_transactions();

  int counttt = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        children: [],
      ),
    );
  }
}
