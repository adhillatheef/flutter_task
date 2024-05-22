import 'package:flutter/material.dart';

import '../model/user_model.dart';

class UserListTile extends StatelessWidget {
  final User user;
  final VoidCallback onDelete;

  const UserListTile({super.key, required this.user, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.picture.thumbnail),
      ),
      title: Text('${user.name.first} ${user.name.last}'),
      subtitle: Text('Age: ${user.dob.age}\nGender: ${user.gender}'),
      isThreeLine: true,
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red,),
        onPressed: onDelete, // Call onDelete when the button is pressed
      ),
    );
  }
}
