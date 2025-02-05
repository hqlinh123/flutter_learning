import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/bloc/user_event.dart';
import 'package:learning_flutter/bloc/user_state.dart';
import 'package:learning_flutter/repositories/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial());

  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUser) {
      yield UserLoading();

      try {
        final user = await userRepository.fetchUser();
        yield UserLoaded(user: user);
      } catch (e) {
        yield UserError(message: e.toString());
      }
    }
  }
}
