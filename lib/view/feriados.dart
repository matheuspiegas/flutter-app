import 'package:flutter/material.dart';
import 'package:flutterteste/view/menu.dart';

class Feriados extends StatelessWidget {
  const Feriados({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(
        selectedMenuItem: 1,
      ),
      appBar: AppBar(
        title: const Text('Feriados'),
      ),
      body: const Center(
        child: Text('Feriados'),
      ),
    );
  }
}
