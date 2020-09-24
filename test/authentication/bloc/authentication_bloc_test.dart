import 'dart:ffi';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_login/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUser extends Mock implements User {}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

main() {
  final user = MockUser();

  AuthenticationRepository authenticationRepository;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    when(authenticationRepository.user).thenAnswer((_) => const Stream.empty());
  });

  group('AuthenticationBloc', () {
    test('throws when authenticationRepository is null', () {
      expect(() => AuthenticationBloc(authenticationRepository: null),
          throwsAssertionError);
    });

    test('initial state is AuthenticationState.unknown', () {
      final authenticationBloc = AuthenticationBloc(
          authenticationRepository: authenticationRepository);
      expect(authenticationBloc.state, const AuthenticationState.unknown());
      authenticationBloc.close();
    });

    blocTest<AuthenticationBloc, AuthenticationState>('Subcrible to stream',
        build: () {
      when(authenticationRepository.user)
          .thenAnswer((realInvocation) => Stream.value(user));
      return AuthenticationBloc(
          authenticationRepository: authenticationRepository);
    }, expect: <AuthenticationState>[AuthenticationState.authenticated(user)]);
  });

  group('AuthenticationUserChanged', () {
    blocTest<AuthenticationBloc, AuthenticationState>(
        'emits [authenticated] when user is not null',
        build: () => AuthenticationBloc(
            authenticationRepository: authenticationRepository),
        act: (bloc) => bloc.add(AuthenticationUserChanged(user)),
        expect: <AuthenticationState>[AuthenticationState.authenticated(user)]);
  });
}
