import 'package:flutter/material.dart';
import 'package:projeto1/models/tarefa.dart';
import 'package:projeto1/database/tarefas_dao.dart';

class Editor extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controladorTarefa = TextEditingController();
  final TextEditingController _controladorObs = TextEditingController();
  int? _id;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
/*     return Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controlador,
          style: TextStyle(fontSize: 24.0),
          decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: dica,
          ),
        )); */

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _controladorTarefa,
            style: TextStyle(fontSize: 24.0),
            decoration: InputDecoration(
              icon: Icon(Icons.assessment),
              labelText: "Tarefa",
              hintText: "Informe Tarefa",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Preencha o campo';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _controladorObs,
            style: TextStyle(fontSize: 24.0),
            decoration: InputDecoration(
              icon: Icon(Icons.assessment),
              labelText: "Obs",
              hintText: "Informe Obs",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Preencha o campo';
              }
              return null;
            },
          ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  
                    _criarTarefa(context);
                }
              },
              child: const Text('confirmar'),
            ),
          ),
        ],
      ),
    );
  }

  void _criarTarefa(BuildContext context) {
    TarefasDao _dao = new TarefasDao();
    if (_id != null) {
      //alterar
      final tarefaCriada =
          Tarefa(_id!, _controladorTarefa.text, _controladorObs.text);
      _dao.update(tarefaCriada).then((id) => Navigator.pop(context));
    } else {
      //incluir
      final tarefaCriada =
          Tarefa(0, _controladorTarefa.text, _controladorObs.text);
      _dao.save(tarefaCriada).then((id) => Navigator.pop(context));
    }
    final SnackBar snackBar = SnackBar(content: const Text('Tarefa Criada'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
