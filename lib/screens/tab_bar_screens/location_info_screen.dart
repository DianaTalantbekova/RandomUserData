import 'package:flutter/material.dart';
import 'package:random_data/models/user_model.dart';

class LocationInfo extends StatelessWidget {
  final UserModel userModel;
  const LocationInfo({Key? key, required this.userModel}) : super(key: key);

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
                  'name:',
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
                  'country:',
                ),
                Spacer(),
                Text(
                  userModel.results.first.location.country,
                ),
              ],
            ),
            Divider(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'state:',
                ),
                Spacer(),
                Text(
                  userModel.results.first.location.state,
                ),
              ],
            ),
            Divider(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'city:',
                ),
                Spacer(),
                Text(
                  userModel.results.first.location.city,
                ),
              ],
            ),
            Divider(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'street:',
                ),
                Spacer(),
                Text(
                  userModel.results.first.location.street.number.toString() +
                      " " +
                      userModel.results.first.location.street.name,
                ),
              ],
            ),
            Divider(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'postcode:',
                ),
                Spacer(),
                Text(userModel.results.first.location.postcode.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
