import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:projeto1/database/tarefas_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'dbtarefas.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TarefasDao.tableSQL);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
