import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_data/bloc/randomdata_bloc.dart';
import 'package:random_data/screens/button.dart';
import 'package:random_data/screens/tab_bar_screens/email_info_screen.dart';
import 'package:random_data/screens/tab_bar_screens/location_info_screen.dart';
import 'package:random_data/screens/tab_bar_screens/main_info_screen.dart';
import 'package:random_data/screens/user_profile_image_name.dart';

class UserMainInfo extends StatefulWidget {
  const UserMainInfo({Key? key}) : super(key: key);

  @override
  State<UserMainInfo> createState() => _UserMainInfoState();
}

class _UserMainInfoState extends State<UserMainInfo>
    with TickerProviderStateMixin {
  RandomDataBloc _randomDataBloc = RandomDataBloc();
  @override
  void initState() {
    _randomDataBloc.add(GetUserInfoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocConsumer<RandomDataBloc, RandomDataState>(
          listener: (context, state) {
            if (state is UserErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  duration: Duration(
                    seconds: 1,
                  ),
                ),
              );
            }
          },
          bloc: _randomDataBloc,
          builder: (context, state) {
            if (state is UserLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is UserErrorState) {
              return Center(
                child: ElevatedButton(
                  child: Text("try again"),
                  onPressed: () {
                    _randomDataBloc.add(GetUserInfoEvent());
                  },
                ),
              );
            }
            if (state is UserFetchedState) {
              return SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      ProfileImageName(
                        userModel: state.userModel,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            controller: _tabController,
                            indicatorColor: Colors.black,
                            tabs: [
                              Tab(
                                text: 'Main info',
                              ),
                              Tab(
                                text: 'Location',
                              ),
                              Tab(
                                text: 'Email',
                              ),
                            ],
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 600,
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 40),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.68,
                                  color: Colors.blue[100],
                                  child: Column(
                                    children: [
                                      MainInfo(
                                        userModel: state.userModel,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Button(randomDataBloc: _randomDataBloc),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 40),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.68,
                                  color: Colors.blue[100],
                                  child: Column(
                                    children: [
                                      LocationInfo(
                                        userModel: state.userModel,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Button(randomDataBloc: _randomDataBloc),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 40),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.68,
                                  color: Colors.blue[100],
                                  child: Column(
                                    children: [
                                      EmailInfo(userModel: state.userModel),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Button(randomDataBloc: _randomDataBloc),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            return SizedBox();
          }),
    );
  }
}
