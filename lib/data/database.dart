import 'package:flutter_app/data/cadastro_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getdatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(CadastroDao.cadastrosEmail);
    },
    version: 1,
  );
}
