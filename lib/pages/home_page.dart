
import 'package:cubit_example_for_state_management/cubits/cubit_users_states.dart';
import 'package:cubit_example_for_state_management/cubits/users_cubit.dart';
import 'package:cubit_example_for_state_management/model/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late UsersCubit usersCubit;

  @override
  void initState() {
    usersCubit = UsersCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersCubit>(
      create: (context) => usersCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          centerTitle: true,
          title: const Text('Cubit App'),
        ),
        body: BlocBuilder<UsersCubit, CubitUsersState>(
          builder: (context, state) {
            if(state is CubitUsersLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is CubitUsersLoadedState){
                  var data = state.userList.map((e) => UsersModel.fromJson(e)).toList();
              return ListView.builder(
                itemCount: state.userList.length,
                itemBuilder: (context, index) {

                  return  Card(
                    color: Colors.grey,
                    child: ListTile(
                      title: Text(data[index].name),
                      subtitle: Text(data[index].email),

                    ),
                  );
                },

              );
            }
            else{
              return Container();
            }

          },
        ),
      ),
    );
  }
}
