import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:learning_flutter/bloc/user_bloc.dart';
import 'package:learning_flutter/bloc/user_event.dart';
import 'package:learning_flutter/bloc/user_state.dart';
import 'package:learning_flutter/models/user_model.dart';
import 'package:learning_flutter/repositories/user_repository.dart';
import 'package:mockito/mockito.dart';  // Đảm bảo import mockito

// Mock class cho UserRepository
class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late UserBloc userBloc;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    userBloc = UserBloc(userRepository: mockUserRepository);
  });

  tearDown(() {
    userBloc.close();
  });

  group('UserBloc', () {
    test('initial state should be UserInitial', () {
      // Kiểm tra trạng thái ban đầu của BLoC
      expect(userBloc.state, equals(UserInitial()));
    });

    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserLoaded] when FetchUser is added and repository returns data',
      build: () {
        // Setup mock repository trả về user data khi gọi getUser()
        when(mockUserRepository.fetchUser()).thenAnswer(
          (_) async => User(id: 1, name: 'John Doe', email: 'john@example.com')
        );
        return userBloc;
      },
      act: (bloc) => bloc.add(FetchUser()),
      expect: () => [
        UserLoading(),
        UserLoaded(user: User(id: 1, name: 'John Doe', email: 'john@example.com'))
      ],
    );

    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserError] when FetchUser is added and repository throws an error',
      build: () {
        // Setup mock repository ném lỗi khi gọi getUser()
        when(mockUserRepository.fetchUser()).thenThrow(Exception('Failed to fetch user'));
        return userBloc;
      },
      act: (bloc) => bloc.add(FetchUser()),
      expect: () => [
        UserLoading(),
        UserError(message: 'Failed to fetch user')
      ],
    );
  });
}
