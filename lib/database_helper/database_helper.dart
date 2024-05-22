import 'package:hive_flutter/hive_flutter.dart';

import '../model/user_model.dart';

class DatabaseHelper {
  static const String _boxName = 'userBox';

  // Initialize Hive
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(NameAdapter());
    Hive.registerAdapter(LocationAdapter());
    Hive.registerAdapter(StreetAdapter());
    Hive.registerAdapter(CoordinatesAdapter());
    Hive.registerAdapter(TimezoneAdapter());
    Hive.registerAdapter(LoginAdapter());
    Hive.registerAdapter(DobAdapter());
    Hive.registerAdapter(RegisteredAdapter());
    Hive.registerAdapter(IdAdapter());
    Hive.registerAdapter(PictureAdapter());
  }

  // Open the box
  static Future<Box<User>> _openBox() async {
    var box = await Hive.openBox<User>(_boxName);
    return box;
  }

  // Add a user to the box
  static Future<void> addUser(User user) async {
    var box = await _openBox();
    await box.add(user);
  }

  // Add multiple users to the box
  static Future<void> addUsers(List<User> users) async {
    var box = await _openBox();
    await box.clear();
    await box.addAll(users);
  }

  // Get all users from the box
  static Future<List<User>> getUsers() async {
    var box = await _openBox();
    return box.values.toList();
  }

  // Get a specific user by index
  static Future<User?> getUser(int index) async {
    var box = await _openBox();
    return box.getAt(index);
  }

  // Delete a user by index
  static Future<void> deleteUser(int index) async {
    var box = await _openBox();
    await box.deleteAt(index);
  }

  // Close the box
  static Future<void> closeBox() async {
    await Hive.close();
  }
}
