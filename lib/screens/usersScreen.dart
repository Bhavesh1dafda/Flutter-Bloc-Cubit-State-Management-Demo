import 'package:cubit_demo/cubits/product_cubit/products_cubit.dart';
import 'package:cubit_demo/cubits/user_detail_cubit/user_detail_cubit.dart';
import 'package:cubit_demo/cubits/users_cubit/users_cubit.dart';
import 'package:cubit_demo/screens/user_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  bool _isProductShow = false;

  @override
  void initState() {
    super.initState();
    context.read<UsersCubit>().getUsersList();
    context.read<ProductsCubit>().getUsersPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(_isProductShow ? "Posts" : "Users"),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isProductShow = !_isProductShow;
                });
              },
              child: Text(
                _isProductShow ? 'Show Users' : 'Show Posts',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            _isProductShow
                ? Expanded(
                    child: BlocConsumer<ProductsCubit, ProductsState>(
                      listener: (context, state) {
                        if (state is ProductsLoadedState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data loaded successfully'),
                            ),
                          );
                        } else if (state is ProductsErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to load data'),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is ProductsLoadedState) {
                          return ListView.separated(
                            separatorBuilder: (context, index) {
                              return const Divider(
                                color: Colors.black54,
                              );
                            },
                            itemCount: state.userpostModel.length,
                            itemBuilder: (context, index) {
                              var users = state.userpostModel[index];
                              return ListTile(
                                title: Text(users.title!),
                                subtitle: Text(users.body!),
                              );
                            },
                          );
                        } else if (state is ProductsLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is ProductsErrorState) {
                          return const Center(
                              child: Text("Something went wrong"));
                        }

                        return const SizedBox();
                      },
                    ),
                  )
                : Expanded(
                    child: BlocConsumer<UsersCubit, UsersState>(
                      listener: (context, state) {
                        if (state is UsersLoadedState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data loaded successfully'),
                            ),
                          );
                        } else if (state is UsersErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to load data'),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is UsersLoadedState) {
                          return ListView.separated(
                            separatorBuilder: (context, index) {
                              return const Divider(
                                color: Colors.black54,
                              );
                            },
                            itemCount: state.userModel.length,
                            itemBuilder: (context, index) {
                              var users = state.userModel[index];
                              return InkWell(
                                onTap: () {
                                  BlocProvider.of<UserDetailCubit>(context)
                                      .updateModel(users);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UsersDetail()));
                                },
                                child: ListTile(
                                  title: Text(users.name ?? ""),
                                  subtitle: Text(users.email ?? " "),
                                ),
                              );
                            },
                          );
                        } else if (state is UsersLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is UsersErrorState) {
                          return const Center(
                              child: Text("Something went wrong"));
                        }

                        return const SizedBox();
                      },
                    ),
                  ),
          ],
        ));
  }
}
