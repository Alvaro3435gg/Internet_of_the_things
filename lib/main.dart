import 'package:flutter/material.dart';
import 'dart:math';

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
      debugShowCheckedModeBanner: false,
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
  // Estados independientes para cada Switch y números en la segunda columna
  List<bool> switchValues = List.generate(7, (index) => false);
  List<String> frutas = ["Manzana", "Plátano", "Uva", "Naranja", "Fresa", "Kiwi", "Pera"];
  List<int> tempAmb = [25, 40, 23, 35, 26, 24, 42];
  List<int> tempIde = [30, 32, 29, 31, 28, 27, 30];

  // Lista para almacenar las placas generadas
  List<String> placasGeneradas = [];

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
                  (index) {
                // Condición para cambiar el color del contenedor
                Color containerColor =
                tempAmb[index] > tempIde[index] ? Colors.orange[300]! : Colors.blue[100]!;
                Color borderColor = Colors.blue[900]!;

                if (tempAmb[index] > tempIde[index]) {
                  // Cambiar el color del borde si tempAmb es mayor que tempIde
                  borderColor = Colors.orange[900]!;
                }

                // Generar la placa aleatoria si aún no ha sido generada
                String placa = placasGeneradas.length > index
                    ? placasGeneradas[index]
                    : _generateRandomPlate();

                // Almacenar la placa generada para su referencia posterior
                if (placasGeneradas.length <= index) {
                  placasGeneradas.add(placa);
                }

                return Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: MediaQuery.of(context).size.width * 0.05),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: borderColor,
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
                            Text(
                              placa, // Utilizar la placa generada
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                            Text(
                              frutas[index],
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text('Temp-Fruta: ${tempAmb[index]}'),
                            SizedBox(height: 10.0),
                            Text('Temp-Ide: ${tempIde[index]}'),
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Función para generar una placa aleatoria
  String _generateRandomPlate() {
    final String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final Random random = Random();
    String plate = '';
    for (int i = 0; i < 7; i++) {
      plate += alphabet[random.nextInt(alphabet.length)];
    }
    return plate;
  }
}
