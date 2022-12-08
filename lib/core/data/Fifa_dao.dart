import 'package:fifamanagement/core/data/fifa_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class FifaDao {
  @Query('select * fram fifa')
  Future<List<Fifa>> findAllFifa();
  @Query('select * from fifa order by id desc limit 1')
  Future<Fifa?> getMaxId();
  @Query('select * fram fifa order by id desc')
  Stream<List<Fifa>> streamedData();

  @insert
  Future<void> insertFifa(Fifa fifa);
  @update
  Future<void> updateFifa(Fifa fifa);
  @Query('delete * fram fifa where id = :id')
  Future<void> deleteFifa(int id);
  @delete
  Future<int> deleteAll(List<Fifa> list);
}
