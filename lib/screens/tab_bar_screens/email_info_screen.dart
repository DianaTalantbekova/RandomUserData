import 'package:flutter/material.dart';
import 'package:random_data/models/user_model.dart';

class EmailInfo extends StatefulWidget {
  final UserModel userModel;
  const EmailInfo({Key? key, required this.userModel}) : super(key: key);

  @override
  State<EmailInfo> createState() => _EmailInfoState();
}

class _EmailInfoState extends State<EmailInfo> {
  @override
  Widget build(BuildContext context) {
    var userModel;
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
                  'Email:',
                ),
                Spacer(),
                Text(
                  userModel.results.first.email,
                ),
              ],
            ),
            Divider(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'Username:',
                ),
                Spacer(),
                Text(userModel.results.first.login.username),
              ],
            ),
            Divider(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'phone:',
                ),
                Spacer(),
                Text(userModel.results.first.phone),
              ],
            ),
            Divider(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'cell:',
                ),
                Spacer(),
                Text(userModel.results.first.cell),
              ],
            ),
            Divider(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'registered:',
                ),
                Spacer(),
                Text(
                  userModel.results.first.registered.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
