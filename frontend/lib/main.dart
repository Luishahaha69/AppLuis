import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Deportiva',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> productos = [
    {'nombre': 'Balón de fútbol', 'precio': 120000},
    {'nombre': 'Zapatillas deportivas', 'precio': 250000},
    {'nombre': 'Guantes de boxeo', 'precio': 90000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tienda Deportiva')),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final p = productos[index];
          return ListTile(
            title: Text(p['nombre']),
            subtitle: Text('Precio: \$${p['precio']}'),
          );
        },
      ),
    );
  }
}
