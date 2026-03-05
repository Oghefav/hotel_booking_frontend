import 'package:floor/floor.dart';

// ignore: experimental_member_use
class StringListConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> decode(String databaseValue){
    return databaseValue.isNotEmpty ? databaseValue.split(',') : [];
  }

  @override
  String encode(List<String> value){
    return value.join(',');
  }
}