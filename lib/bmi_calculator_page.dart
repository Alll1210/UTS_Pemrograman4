import 'package:flutter/material.dart';

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  String selectedGender = '';
  double weight = 0;
  double height = 0;
  int age = 0;
  double bmi = 0;

  double bmr = 0;
  double carbGrams = 0;
  double fatGrams = 0;
  double proteinGrams = 0;

  bool showResult = false;

  void calculateBMI() {
    if (weight > 0 && height > 0) {
      final double heightInMeters = height / 100;
      final double bmiValue = weight / (heightInMeters * heightInMeters);
      setState(() {
        bmi = bmiValue;
        showResult = true; // Menampilkan hasil setelah perhitungan
      });
    }

    if (selectedGender == 'Pria') {
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else if (selectedGender == 'Wanita') {
      bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }

    double calorieGoal = bmr;

    double carbRatio = 0.5;
    double fatRatio = 0.25;
    double proteinRatio = 0.25;

    carbGrams = (calorieGoal * carbRatio) / 4;
    fatGrams = (calorieGoal * fatRatio) / 9;
    proteinGrams = (calorieGoal * proteinRatio) / 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 212, 212),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 4,
              margin: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Jenis Kelamin:',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    title: Text('Pria'),
                    leading: Radio(
                      value: 'Pria',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Wanita'),
                    leading: Radio(
                      value: 'Wanita',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Berat Badan (kg):',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        weight = double.parse(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Tinggi Badan (cm):',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        height = double.parse(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Usia:',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        age = int.parse(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        calculateBMI();
                      },
                      child: Text('Lihat Hasil'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (showResult)
              Card(
                elevation: 4,
                margin: EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hasil perhitungan BMR berada di angka ${bmr.toStringAsFixed(2)} Kkal',
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Kamu memerlukan:',
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Kebutuhan Karbohidrat sebanyak ${carbGrams.toStringAsFixed(2)} gram',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Kebutuhan Lemak sebanyak ${fatGrams.toStringAsFixed(2)} gram',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Kebutuhan Protein sebanyak ${proteinGrams.toStringAsFixed(2)} gram',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
