
import 'package:cubit_example_for_state_management/model/users_model.dart';

abstract class CubitUsersState{}


abstract class CubitUserActionState{}

class CubitUsersLoadingState extends CubitUsersState{}

class CubitUsersLoadedState extends CubitUsersState{
  List<dynamic> userList;
  CubitUsersLoadedState({required this.userList});
}

class CubitUsersErrorState extends CubitUsersState{}