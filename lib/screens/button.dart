import 'package:flutter/material.dart';
import 'package:random_data/bloc/randomdata_bloc.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required RandomDataBloc randomDataBloc,
  }) : _randomDataBloc = randomDataBloc, super(key: key);

  final RandomDataBloc _randomDataBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: InkWell(
        onTap: () {
          _randomDataBloc
              .add(GetUserInfoEvent());
        },
        child: Text(
          'Next',
          style:
              TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}