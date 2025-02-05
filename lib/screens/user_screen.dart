import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_state.dart';
import '../bloc/user_event.dart';
import 'user_detail_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    // Gọi sự kiện khi màn hình được tạo
    context.read<UserBloc>().add(FetchUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Info")),
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserInitial) {
              return _buildInitial();
            } else if (state is UserLoading) {
              return _buildLoading();
            } else if (state is UserLoaded) {
              return _buildUserLoaded(state);
            } else if (state is UserError) {
              return _buildError(state);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildInitial() {
    return ElevatedButton(
      onPressed: () {
        context.read<UserBloc>().add(FetchUser());
      },
      child: const Text("Fetch User"),
    );
  }

  Widget _buildLoading() {
    return const CircularProgressIndicator();
  }

  Widget _buildUserLoaded(UserLoaded state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("ID: ${state.user.id}"),
        Text("Name: ${state.user.name}"),
        Text("Email: ${state.user.email}"),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            context.read<UserBloc>().add(FetchUser());
          },
          child: const Text("Reload"),
        ),
        ElevatedButton(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetailScreen(user: state.user),
              ),
            );
        }, child: const Text("Go to user detail"))
      ],
    );
  }

  Widget _buildError(UserError state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error: ${state.message}"),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            context.read<UserBloc>().add(FetchUser());
          },
          child: const Text("Retry"),
        ),
      ],
    );
  }
}
