import 'package:flutter/material.dart';

import '../../../../core/widgets/app_bar_widgets.dart';

class CalculateBmi extends StatefulWidget {
  const CalculateBmi({super.key});

  @override
  State<CalculateBmi> createState() => _CalculateBmiState();
}

class _CalculateBmiState extends State<CalculateBmi> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidgets(title: 'Calculate Your BMI'),
      body: Container(
        color: Colors.grey.shade200,
        child: Center(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
              child: Column(
                children: [
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                        label: Text('Enter Your Weight(kg)'),
                        prefixIcon: Icon(Icons.line_weight)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16
                  ),
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                        label: Text('Enter Your Height(in Feet)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16
                  ),
                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                        label: Text('Enter Your Height(in Inch)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          var wt = wtController.text.toString();
                          var ft = ftController.text.toString();
                          var inch = inController.text.toString();
                          if (wt != "" && ft != "" && inch != "") {
                            var iWt = int.parse(wt);
                            var iFt = int.parse(ft);
                            var iInch = int.parse(inch);

                            var tInch = (iFt * 12) + iInch;

                            var tcm = tInch * 2.54;

                            var tM = tcm / 100;

                            var bmi = iWt / (tM * tM);

                            var msg = " ";

                            if (bmi > 25) {
                              msg = "You're OverWeight";
                            } else if (bmi < 18) {
                              msg = "You're UnderWeight";
                            } else {
                              msg = "You're Healthy";
                            }

                            setState(() {
                              result =
                                  '$msg \nYour BMI is : ${bmi.toStringAsFixed(2)}';
                            });
                          } else {
                            setState(() {
                              result = "Please fillup all requred filed";
                            });
                          }
                        },
                        child: const Text(
                          'Calculate',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        result,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
