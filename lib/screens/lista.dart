import 'package:flutter/material.dart';
import 'package:projeto1/database/tarefas_dao.dart';
import 'package:projeto1/models/tarefa.dart';
import 'package:projeto1/screens/form.dart';

class ListaTarefa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTarefaState();
    //throw UnimplementedError();
  }
}

class ListaTarefaState extends State<ListaTarefa> {
  final TarefasDao _dao = new TarefasDao();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Tarefas"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final Future future =
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormTarefa();
            }));
            future.then((tarefa) {
              debugPrint("Retornou Form");
              setState(() {});
            });
          },
        ),
        body: FutureBuilder<List<Tarefa>>(
            initialData: [],
            future: Future.delayed(Duration(seconds: 1))
                .then((value) => _dao.findAll()),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  break;
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  if (snapshot.data != null) {
                    final List<Tarefa>? tarefas = snapshot.data;
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          final Tarefa tarefa = tarefas![index];
                          return ItemTarefa(context, tarefa);
                        },
                        itemCount: tarefas!.length);
                  }
                  break;
                default:
                  return Center(child: Text("Nenhuma tarefa"));
              }
              return Center(child: Text("Carregado..."));
            }));
    //throw UnimplementedError();
  }

  Widget ItemTarefa(BuildContext context, Tarefa _tarefa) {
    // TODO: implement build

    return GestureDetector(
        child: InkWell(
            onTap: () {
              print("InkWell Feito");
              final Future future =
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormTarefa(tarefa: _tarefa);
              }));
              future.then((value) => setState(() {}));
            },
            child: Card(
              child: ListTile(
                title: Text(_tarefa.descricao),
                subtitle: Text(_tarefa.obs),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _excluir(context, _tarefa.id);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  void _excluir(BuildContext context, int id) {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
            title: Text("Confirmar"),
            content: Text("Deseja realmente excluir ?"),
            actions: [
              TextButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.of(this.context, rootNavigator: true).pop();
                },
              ),
              TextButton(
                child: Text("Confirmar"),
                onPressed: () {
                  _dao.delete(id).then((value) => setState(() {}));
                  Navigator.of(this.context, rootNavigator: true).pop();
                },
              ),
            ],
          );
        });
  }
}
