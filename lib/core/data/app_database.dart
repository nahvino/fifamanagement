import 'package:fifamanagement/core/data/Fifa_dao.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'package:fifamanagement/core/data/fifa_entity.dart';
import 'package:floor/floor.dart';
part 'app_database.g.dart';

///[build_runner] ---> ///[app_database]
//flutter packages pub run build_runner build
@Database(version: 1, entities: [Fifa])
abstract class AppDatabase extends FloorDatabase {
  FifaDao get fifaDao;
}
