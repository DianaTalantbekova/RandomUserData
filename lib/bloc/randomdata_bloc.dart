import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:random_data/models/user_model.dart';

part 'randomdata_event.dart';
part 'randomdata_state.dart';

class RandomDataBloc extends Bloc<RandomDataEvent, RandomDataState> {
  RandomDataBloc() : super(RandomdataInitial()) {
    on<RandomDataEvent>((event, emit) async {
      UserModel userModel;
      if (event is GetUserInfoEvent) {
        emit(UserLoadingState());
        try {
          var url = Uri.parse('https://randomuser.me/api/');
          var response = await http.get(url);
          if (response.statusCode == 200) {
            userModel = UserModel.fromRawJson(response.body);
            emit(UserFetchedState(userModel: userModel));
          } else {
            emit(UserErrorState(errorMessage: "Error"));
          }
        } on SocketException {
          emit(UserErrorState(errorMessage: 'No internet connection'));
        } catch (e) {
          emit(UserErrorState(errorMessage: e.toString()));
        }
      }
    });
  }
}
