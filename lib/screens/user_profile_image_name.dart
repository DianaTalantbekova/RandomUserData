import 'package:flutter/material.dart';
import 'package:random_data/models/user_model.dart';

class ProfileImageName extends StatelessWidget {
  final UserModel userModel;
  const ProfileImageName({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 60),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.network(userModel.results.first.picture.large),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(userModel.results.first.name.title +
            ' ' +
            userModel.results.first.name.first +
            ' ' +
            userModel.results.first.name.last),
      ],
    );
  }
}