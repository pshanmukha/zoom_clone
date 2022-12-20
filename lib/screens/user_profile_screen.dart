import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
        children: [
          CircleAvatar(
            radius: 130,
            backgroundColor: buttonColor,
            child: CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage(_authMethods.user.photoURL!),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.verified_user),
              title: Text(_authMethods.user.displayName!),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.email),
              title: Text(_authMethods.user.email!),
            ),
          ),
          CustomButton(
              text: 'Log Out', onPresses: () => AuthMethods().signOut(context))
        ],
      )),
    );
  }
}
