import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_login/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUser extends Mock implements User {}

main() {
  group('AuthenticationState', () {
    group('AuthenticationState.unknown', () {
      test('supports value comparisons', () {
        expect(AuthenticationState.unknown(), AuthenticationState.unknown());
      });
    });

    group('Authentication.authenticated', () {
      final user = MockUser();
      test('supports value comparisons', () {
        expect(AuthenticationState.authenticated(user),
            AuthenticationState.authenticated(user));
      });
    });

    group('AuthenticationState.unauthenticated', () {
      test('supports value comparisons', () {
        expect(
          AuthenticationState.unauthenticated(),
          AuthenticationState.unauthenticated(),
        );
      });
    });
  });
}
