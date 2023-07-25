import 'package:bmi_calculator/screens/about_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double finalbmi = 0.0;
  String bmiresult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(child: Text('BMI Calculator')),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AboutScreen())); //page linked with AboutScreen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Your BMI is:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(finalbmi.toStringAsFixed(2),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 80)),
            Text(bmiresult,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Weight (Kg)',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Weight',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Height (cm)',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Height',
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      double weight = double.parse(weightController.text);
                      double height = double.parse(heightController.text);
                      double bmi = weight / ((height / 100) * (height / 100));
                      print(bmi.toStringAsFixed(2));

                      String temp = '';

                      if (bmi < 18.5) {
                        temp = 'Underweight';
                      } else if (bmi >= 18.5 && bmi < 25) {
                        temp = 'Normal';
                      } else if (bmi >= 25 && bmi < 30) {
                        temp = 'Overweight';
                      } else if (bmi >= 30) {
                        temp = 'Obese';
                      }

                      setState(() {
                        finalbmi = bmi;
                        bmiresult = temp;
                      });
                    },
                    child:
                        const Text('Calculate', style: TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        side: BorderSide(
                            width: 1, // the thickness
                            color: Colors.black
                                .withOpacity(0.8) // the color of the border
                            )),
                    onPressed: () {
                      setState(() {
                        weightController.clear();
                        heightController.clear();
                        finalbmi = 0.0;
                        bmiresult = '';
                      });
                    },
                    child: const Text('Reset',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
