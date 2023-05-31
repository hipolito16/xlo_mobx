import 'package:postgres/postgres.dart';
import 'package:mobx/mobx.dart';

part 'postgres_store.g.dart';

class PostgresStore = _PostgresStore with _$PostgresStore;

abstract class _PostgresStore with Store {
  _PostgresStore() {
    final postgreSQLResult = query('SELECT * FROM "user"');
  }

  static final conn = PostgreSQLConnection('35.247.236.38', 5432, 'XLOMobx', username: 'postgres', password: 'cer_2011!');

  @action
  Future<void> open() async {
    await conn.open();
  }

  @action
  Future<void> close() async {
    await conn.close();
  }

  @action
  Future<void> query(String sql) async {
    await conn.open();
    final response = await conn.query(sql);

    for (final row in response) {
      print(row.toColumnMap()['username']);
      conn.close();
    }
  }
}
