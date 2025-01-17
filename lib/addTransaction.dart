import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_tracker/variables.dart';

class add_transactions extends StatefulWidget {
  const add_transactions({super.key});

  @override
  State<add_transactions> createState() => _add_transactionsState();
}

class _add_transactionsState extends State<add_transactions> {
  String saveAmount = '';
  int saveAmountwithoutComma = 0;
  String EntryType = "none";

  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();

    ExpenseController.addListener(() {
      setState(() {
        saveAmount = ExpenseController.text;
      });
    });
  }

  @override
  void dispose() {
    ExpenseController.dispose();

    super.dispose();
  }

  bool checkall() {
    if (ExpenseController.text.isNotEmpty) {
      if (EntryType != "none") {
        return true;
      }
      return false;
    } else {
      return false;
    }
  }

  TextEditingController ExpenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF018D63),
          leading: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
          title: Text(
            "Enter Expense/Income",
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                  decoration: TextDecoration.none),
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/image1.png',
                ), // Replace 'your_image.jpg' with your image path
                fit: BoxFit.fitHeight,
                opacity: 0.05),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: TextField(
                  controller: ExpenseController,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    inputFormater(),
                  ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixText: "\$  ",
                    contentPadding: EdgeInsets.all(20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    hintText: 'Enter amount',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: CustomRadioButton(
                  elevation: 0.2,
                  absoluteZeroSpacing: false,
                  unSelectedColor: Colors.white,
                  buttonLables: const [
                    'Income',
                    'Expense',
                  ],
                  buttonValues: const [
                    "Income",
                    "Expense",
                  ],
                  horizontal: false,
                  padding: 3,
                  spacing: 20,
                  enableShape: true,
                  enableButtonWrap: true,
                  buttonTextStyle: const ButtonTextStyle(
                      selectedColor: Colors.white,
                      unSelectedColor: Colors.black54,
                      textStyle: TextStyle(fontSize: 16)),
                  radioButtonValue: (value) {
                    print(value);
                    setState(() {
                      EntryType = value;
                    });
                  },
                  unSelectedBorderColor: Colors.grey,
                  selectedBorderColor: const Color(0xFF018D63),
                  selectedColor: const Color(0xFF018D63),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF018D63),
                ),
                onPressed: checkall()
                    ? () {
                        setState(() {
                          saveAmountwithoutComma = removeCommas(saveAmount);
                          transactions.add(saveAmountwithoutComma);
                          transactionString.add(saveAmount);

                          print("XXXXXXXXXXXXXXXXXX");
                          dates.add(DateFormat('dd MM yyyy').format(now));
                          times.add(DateFormat('jm').format(now));

                          if (EntryType == 'Expense') {
                            isExpense.add(true);
                          } else {
                            isExpense.add(false);
                          }

                          print(dates[counter]);
                          print(times[counter]);
                          print(isExpense[counter]);
                          print(counter);

                          listDateTime.add(DateTime.now());

                          counter++;

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: CheckExpense()
                                ? Colors.redAccent
                                : Colors.green,
                            content: const Text(
                              'Amount has been registered',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            duration: const Duration(seconds: 3),
                          ));
                          Calculation(saveAmountwithoutComma);
                          print("_______ $Total_ammount _____");
                          ExpenseController.clear();
                        });
                      }
                    : null,
                child: Text(
                  "Register amount",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Calculation(int inputAmmount) {
    if (EntryType == 'Income') {
      Total_ammount = Total_ammount + inputAmmount;
    }
    if (EntryType == 'Expense') {
      Total_ammount = Total_ammount - inputAmmount;
    }
  }

  bool CheckExpense() {
    return EntryType == 'Expense';
  }

  int removeCommas(String inputString) {
    List<String> parts = inputString.split(',');

    String stringWithoutCommas = parts.join('');

    int result = int.tryParse(stringWithoutCommas) ?? 0;

    return result;
  }
}

class inputFormater extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String enteredData = newValue.text; // get data enter by used in textField
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < enteredData.length; i++) {
      buffer.write(enteredData[i]);
      int index = i + 1;
      if (index % 3 == 0 && enteredData.length != index) {
        buffer.write(",");
      }
    }

    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.toString().length));
  }
}
