import 'package:cubit_demo/cubits/user_detail_cubit/user_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersDetail extends StatelessWidget {
  const UsersDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Detail"),
      ),
      body: BlocConsumer<UserDetailCubit, UserDetailState>(
        listener: (context, state) {
          if (state is UserDetailLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Data loaded successfully'),
              ),
            );
          } else if (state is UserDetailLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Data loaded successfully'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UserDetailLoading) {
            return const CircularProgressIndicator();
          } else if (state is UserDetailLoaded) {
            return Center(
              child: Column(
                children: [
                  Text(state.userModel?.email.toString() ?? ""),
                  Text(state.userModel?.address.toString() ?? ""),
                  Text(state.userModel?.phone.toString() ?? ""),
                  Text(state.userModel?.website.toString() ?? ""),
                  Text(state.userModel?.company.toString() ?? ""),
                  Text(state.userModel?.username.toString() ?? ""),
                ],
              ),
            );
          } else if (state is UserDetailError) {
            return Center(child: Text(state.errorMsg.toString()));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
