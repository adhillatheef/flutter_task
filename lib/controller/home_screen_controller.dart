import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../database_helper/database_helper.dart';
import '../model/user_model.dart';

enum SortOrder { ascending, descending }

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;
  var isAscendingOrder = true.obs;
  var isAgeAscendingOrder = true.obs;


  @override
  void onInit() {
    super.onInit();
    fetchAndStoreUsers();
  }

  Future<void> fetchAndStoreUsers() async {
    isLoading(true);
    try {
      final response = await Dio().get('https://randomuser.me/api/?results=10');

      if (response.statusCode == 200) {
        final List<User> apiUsers = (response.data['results'] as List)
            .map((data) => User.fromJson(data))
            .toList();

        await DatabaseHelper.addUsers(apiUsers);
        users.assignAll(await DatabaseHelper.getUsers());
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteUser(int index) async {
    try {
      await DatabaseHelper.deleteUser(index);
      users.removeAt(index);
    } catch (e) {
      print(e);
    }
  }

  void toggleSortOrder() {
    isAscendingOrder.value = !isAscendingOrder.value;
    if (isAscendingOrder.value) {
      _sortUsers(SortOrder.ascending);
    } else {
      _sortUsers(SortOrder.descending);
    }
  }

  void toggleSortOrderByAge() {
    isAgeAscendingOrder.value = !isAgeAscendingOrder.value;
    if (isAgeAscendingOrder.value) {
      _sortUsersAge(SortOrder.ascending);
    } else {
      _sortUsersAge(SortOrder.descending);
    }
  }

  void _sortUsers(SortOrder order) {
    switch (order) {
      case SortOrder.ascending:
        _sortUsersAscending();
        break;
      case SortOrder.descending:
        _sortUsersDescending();
        break;
    }
  }

  void _sortUsersAge(SortOrder order) {
    switch (order) {
      case SortOrder.ascending:
        _sortUsersAscendingByAge();
        break;
      case SortOrder.descending:
        _sortUsersDescendingByAge();
        break;
    }
  }

  void _sortUsersAscending() {
      users.sort((a, b) => a.name.first.compareTo(b.name.first));
  }

  void _sortUsersDescending() {
      users.sort((a, b) => b.name.first.compareTo(a.name.first));
  }

  void _sortUsersAscendingByAge(){
    users.sort((a, b) => a.dob.age.compareTo(b.dob.age));
  }

  void _sortUsersDescendingByAge(){
    users.sort((a, b) => b.dob.age.compareTo(a.dob.age));
  }

}
