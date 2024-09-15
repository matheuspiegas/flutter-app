import 'package:flutter/material.dart';
import 'package:flutterteste/controller/feriados_controller.dart';
import 'package:flutterteste/model/feriados_model.dart';
import 'package:flutterteste/model/feriados_repository.dart';
import 'package:flutterteste/view/menu.dart';

class Feriados extends StatelessWidget {
  const Feriados({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MenuDrawer(
          selectedMenuItem: 1,
        ),
        appBar: AppBar(
          title: const Text('Feriados'),
        ),
        body: FutureBuilder<List<FeriadoEntity>>(
          future: FeriadosRepository().getFeriados(),
          builder: (BuildContext context,
              AsyncSnapshot<List<FeriadoEntity>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final List<FeriadoEntity> feriado = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  itemCount: feriado.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.translate(
                                offset: const Offset(0, 2.5),
                                child: Text(FeriadosController()
                                    .GetDay(feriado[index].date)),
                              ),
                              Transform.translate(
                                offset: const Offset(0, -2.5),
                                child: Text(
                                  FeriadosController()
                                      .GetMonth(feriado[index].date),
                                  style: const TextStyle(
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        title: Text(feriado[index].name),
                        subtitle: Text(feriado[index].type == 'national'
                            ? 'Nacional'
                            : feriado[index].type),
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(
                child: Text('Nenhum dado encontrado')); // Se não há dados
          },
        ));
  }
}
