import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
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
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Masukkan suhu celcius",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(25))),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                  onPressed: () {},
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
