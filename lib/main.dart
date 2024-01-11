import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final formkey = GlobalKey<FormState>();
  final _messangerkey = GlobalKey<ScaffoldMessengerState>();
  TextEditingController input = TextEditingController();

  double kelvin = 0;
  double reamur = 0;
  double fahrenheit = 0;

  hitung() {
    setState(() {
      if (formkey.currentState!.validate()) {
        reamur = 4 / 5 * double.parse(input.text);
        kelvin = double.parse(input.text) + 273;
        fahrenheit = (double.parse(input.text) * 9 / 5) + 32;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: _messangerkey,
        title: 'Konverter suhu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Konverter Suhu",
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: formkey,
                  child: TextFormField(
                    controller: input,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        _messangerkey.currentState!.showSnackBar(
                            const SnackBar(content: Text("Input Number")));
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Masukkan suhu celcius",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(25))),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Suhu dalam Kelvin"),
                        Text(
                          "Nilai",
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text("Suhu dalam Reamur"),
                        Text(
                          "Nilai",
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      print(input.text);
                    }
                  },
                  child: Text("Hitung"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(40),
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white),
                ),
              ],
            ),
          ),
        ));
  }
}
