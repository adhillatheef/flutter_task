import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_screen_controller.dart';
import '../widgets/user_card.dart';

class HomePage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          actions: [
            _buildSortIconButton(
              icon: Icons.filter_list,
              onPressed: userController.toggleSortOrder,
              isActive: userController.isAscendingOrder.value,
            ),
            _buildSortIconButton(
              icon: Icons.filter_alt_rounded,
              onPressed: userController.toggleSortOrderByAge,
              isActive: userController.isAgeAscendingOrder.value,
            ),
          ],
        ),
        body: userController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : userController.users.isEmpty
            ? const Center(child: Text("No Users Found"))
            : ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            var user = userController.users[index];
            return UserListTile(
              user: user,
              onDelete: () {
                userController.deleteUser(index);
              },
            );
          },
        ),
      );
    });
  }

  Widget _buildSortIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    required bool isActive,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      color: isActive ? Colors.blue : null,
    );
  }
}
