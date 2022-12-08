import 'package:floor/floor.dart';

@entity
class Fifa {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String name;
  final String falmiy;
  final String age;
  final String adress;
  @ignore
  bool isSelect = false;
  Fifa(this.id, this.name, this.falmiy, this.age, this.adress);
}
