import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_expense_tracker/variables.dart';

class transactions_list extends StatefulWidget {
  transactions_list({super.key});

  @override
  State<transactions_list> createState() => _transactions_listState();
}

class _transactions_listState extends State<transactions_list> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Transactions",
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF018D63),
                      letterSpacing: 2)),
            ),
          ),
          ListView.builder(
            shrinkWrap: true, // Important to prevent vertical scrolling issues
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            itemCount: counter,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: isExpense[index]
                      ? const Color.fromRGBO(190, 39, 39, 1)
                      : const Color.fromRGBO(6, 169, 120, 1),
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                      trailing: GestureDetector(
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onTap: () {
                          setState(() {
                            transactionString.removeAt(index);
                            transactions.removeAt(index);
                            isExpense.removeAt(index);
                            dates.removeAt(index);
                            times.removeAt(index);

                            counter--;
                          });
                        },
                      ),
                      leading: const Icon(
                        Icons.attach_money,
                        color: Colors.white,
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
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              isExpense[index]
                                  ? const Text(
                                      "Expense",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      "Income",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    )
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                dates[index],
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                times[index],
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: null),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
