// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FifaDao? _fifaDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Fifa` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `name` TEXT NOT NULL, `falmiy` TEXT NOT NULL, `age` TEXT NOT NULL, `adress` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FifaDao get fifaDao {
    return _fifaDaoInstance ??= _$FifaDao(database, changeListener);
  }
}

class _$FifaDao extends FifaDao {
  _$FifaDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _fifaInsertionAdapter = InsertionAdapter(
            database,
            'Fifa',
            (Fifa item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'falmiy': item.falmiy,
                  'age': item.age,
                  'adress': item.adress
                },
            changeListener),
        _fifaUpdateAdapter = UpdateAdapter(
            database,
            'Fifa',
            ['id'],
            (Fifa item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'falmiy': item.falmiy,
                  'age': item.age,
                  'adress': item.adress
                },
            changeListener),
        _fifaDeletionAdapter = DeletionAdapter(
            database,
            'Fifa',
            ['id'],
            (Fifa item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'falmiy': item.falmiy,
                  'age': item.age,
                  'adress': item.adress
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Fifa> _fifaInsertionAdapter;

  final UpdateAdapter<Fifa> _fifaUpdateAdapter;

  final DeletionAdapter<Fifa> _fifaDeletionAdapter;

  @override
  Future<List<Fifa>> findAllFifa() async {
    return _queryAdapter.queryList('select * fram fifa',
        mapper: (Map<String, Object?> row) => Fifa(
            row['id'] as int,
            row['name'] as String,
            row['falmiy'] as String,
            row['age'] as String,
            row['adress'] as String));
  }

  @override
  Future<Fifa?> getMaxId() async {
    return _queryAdapter.query('select * from fifa order by id desc limit 1',
        mapper: (Map<String, Object?> row) => Fifa(
            row['id'] as int,
            row['name'] as String,
            row['falmiy'] as String,
            row['age'] as String,
            row['adress'] as String));
  }

  @override
  Stream<List<Fifa>> streamedData() {
    return _queryAdapter.queryListStream('select * fram fifa order by id desc',
        mapper: (Map<String, Object?> row) => Fifa(
            row['id'] as int,
            row['name'] as String,
            row['falmiy'] as String,
            row['age'] as String,
            row['adress'] as String),
        queryableName: 'Fifa',
        isView: false);
  }

  @override
  Future<void> deleteFifa(int id) async {
    await _queryAdapter
        .queryNoReturn('delete * fram fifa where id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertFifa(Fifa fifa) async {
    await _fifaInsertionAdapter.insert(fifa, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateFifa(Fifa fifa) async {
    await _fifaUpdateAdapter.update(fifa, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteAll(List<Fifa> list) {
    return _fifaDeletionAdapter.deleteListAndReturnChangedRows(list);
  }
}
