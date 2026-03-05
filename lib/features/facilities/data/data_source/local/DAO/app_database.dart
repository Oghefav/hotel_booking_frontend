import 'dart:async';

import 'package:hotel_booking_app/core/resources/string_list_converter.dart';
import 'package:hotel_booking_app/features/facilities/data/data_source/local/DAO/hotel_dao.dart';
import 'package:hotel_booking_app/features/facilities/data/model/hotel.dart';
import 'package:sqflite/sqflite.dart'  as sqflite;
import 'package:floor/floor.dart';
part 'app_database.g.dart';

// ignore: experimental_member_use
@TypeConverters([StringListConverter])
@Database(version: 1, entities: [HotelModel])
abstract class AppDatabase extends FloorDatabase {
  HotelDao get hotelDao;
}