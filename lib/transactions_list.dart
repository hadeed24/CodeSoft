import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_expense_tracker/addTransaction.dart';
import 'package:personal_expense_tracker/variables.dart';

class transactions_list extends StatefulWidget {
  transactions_list({super.key});

  @override
  State<transactions_list> createState() => _transactions_listState();
}

class _transactions_listState extends State<transactions_list> {
  void refresh() {
    setState(() {
      print("REFRESHED**********************************");
    });
  }

  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true, // Important to prevent vertical scrolling issues
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            itemCount: counter,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: Colors.white,
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                    trailing: GestureDetector(
                      child: const Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        print("GESTUREZZZZZZZZZZZZZZZZZZZZZ");
                      },
                    ),
                    leading: const Icon(
                      Icons.attach_money,
                      color: Colors.grey,
                      size: 25,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactionString[index],
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "Transaction type",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "listDateTime[index] as String",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "Recorde",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: null),
              );
            },
          ),
        ],
      ),
    );
  }
}
