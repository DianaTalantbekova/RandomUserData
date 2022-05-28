import 'package:flutter/material.dart';
import 'package:random_data/models/user_model.dart';

class MainInfo extends StatelessWidget {
  final UserModel userModel;
  const MainInfo({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.brown[50],
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 40, left: 50, top: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'First\nname',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  userModel.results.first.name.first,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'Last\nname',
                ),
                Spacer(),
                Text(
                  userModel.results.first.name.last,
                ),
              ],
            ),
            Divider(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'Gender',
                ),
                Spacer(),
                Text(
                  userModel.results.first.gender,
                ),
              ],
            ),
            Divider(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'Date of\nBirth',
                ),
                Spacer(),
                Text(
                  userModel.results.first.dob.date.toString(),
                ),
              ],
            ),
            Divider(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'Age',
                ),
                Spacer(),
                Text(
                  userModel.results.first.dob.age.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
