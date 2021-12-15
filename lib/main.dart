// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:projeto1/models/tarefa.dart';
import 'package:projeto1/screens/lista.dart';
import 'package:projeto1/database/app.database.dart';
import 'package:projeto1/database/tarefas_dao.dart';

void main() {
  runApp(TarefaApp());
  /* TarefasDao tarefasDao = new TarefasDao();
  tarefasDao.save(Tarefa(0, 'teste 2', 'obs 2')).then((id) {
    print("ID: " + id.toString());
    tarefasDao.findAll().then((tarefa) => debugPrint(tarefa.toString()));
  });*/
}

class TarefaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.dark(),
        home: ListaTarefa());
    return throw UnimplementedError();
  }
}
