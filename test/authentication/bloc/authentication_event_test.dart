import 'package:flutter_login/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Authentication Event', () {
    group('LoggedOut', () {
      test('supports value comparisons', () {
        expect(
          AuthenticationLogoutRequested(),
          AuthenticationLogoutRequested(),
        );
      });
    });
  });

  group('AuthenticationUserChanged', () {
    test('supports value comparisons', () {
      expect(AuthenticationUserChanged(null), AuthenticationUserChanged(null));
    });
  });
}
