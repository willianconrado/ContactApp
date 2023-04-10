class CadastroDao {
  static const String cadastrosEmail = 'CREATE TABLE $_tablename('
      '$_name TEXT'
      '$_email TEXT, '
      '$_password INTEGER,)';

  static const String _tablename = 'cadastroTable';
  static const String _name = 'name';
  static const String _email = 'email';
  static const String _password = 'password';

  save() {}
}
  