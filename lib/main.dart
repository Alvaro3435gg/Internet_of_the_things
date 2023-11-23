import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de Refrigeración',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Un estado para cada Switch
  List<bool> switchValues = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gestor de Refrigeración',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[300],
      ),
      body: Container(
        color: Colors.pink[50],
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              7,
                  (index) => Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: MediaQuery.of(context).size.width * 0.05),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.blue[900]!,
                    width: 2.0,
                  ),
                ),
                child: Row(
                  children: [
                    // Primera Columna
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Placa'),
                          SizedBox(height: 0.0),
                          Image.asset(
                            'assets/truck3.gif',
                            width: 70.0,
                            height: 70.0,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    // Segunda Columna
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Fruta'),
                          SizedBox(height: 10.0),
                          Text('Temp-Ide'),
                          SizedBox(height: 10.0),
                          Text('Temp-Amb'),
                        ],
                      ),
                    ),
                    // Tercera Columna
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Switch(
                            value: switchValues[index],
                            onChanged: (bool value) {
                              setState(() {
                                switchValues[index] = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
