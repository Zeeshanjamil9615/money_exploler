import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 0) // Unique ID for the Hive Type
class Person extends HiveObject {
  @HiveField(0) // Unique ID for each field
  String name;

  @HiveField(1)
  int age;

  Person(this.name, this.age);
}
