import 'package:cubit_example_for_state_management/model/users_model.dart';
import 'package:cubit_example_for_state_management/repository/users_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit_users_states.dart';

class UsersCubit extends Cubit<CubitUsersState>{


  UsersCubit():super(CubitUsersLoadingState()){
    getData();
  }

  getData()async{
    emit(CubitUsersLoadingState());
  List<dynamic> response = await UsersRepo.getUser();
  emit(CubitUsersLoadedState(userList: response));

  }

}

