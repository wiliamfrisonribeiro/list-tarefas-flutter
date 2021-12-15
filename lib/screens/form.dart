import 'package:flutter/material.dart';
import 'package:projeto1/components/Editor.dart';
import 'package:projeto1/models/tarefa.dart';
import 'package:projeto1/database/tarefas_dao.dart';

class FormTarefa extends StatefulWidget {
  final Tarefa? tarefa;
  final _formKey = GlobalKey<FormState>();
  FormTarefa({this.tarefa});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormTarefaState();
    throw UnimplementedError();
  }
}

class FormTarefaState extends State<FormTarefa> {
  final TextEditingController _controladorTarefa = TextEditingController();
  final TextEditingController _controladorObs = TextEditingController();

  int? _id;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Form Tarefa')),
      body: Column(
        children: [

          Editor()
        /*   Editor(
              _controladorTarefa, "Tarefa", "Informe Tarefa", Icons.assessment),
          Editor(_controladorObs, "Obs", "Informe Obs", Icons.assessment),
          ElevatedButton(
              onPressed: () {
                _criarTarefa(context);
              },
              child: const Text('confirmar')) */
        ],
      ),
    );
    throw UnimplementedError();
  }

  /* void _criarTarefa(BuildContext context) {
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
  } */

  @override
  void initState() {
    super.initState();
    if (widget.tarefa != null) {
      _id = widget.tarefa!.id;
      _controladorTarefa.text = widget.tarefa!.descricao;
      _controladorObs.text = widget.tarefa!.obs;
    }
  }
}
