import 'package:authentication_repository/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User', () {
    const id = 'mock-id';
    const email = 'mock-email';

    test('throws AssertionError when email is null', () {
      expect(() => User(email: null, id: id, name: null, photo: null),
          throwsAssertionError);
    });

    test('throw throwsAssertionError when id is null', () {
      expect(() => User(email: null, id: id, name: null, photo: null),
          throwsAssertionError);
    });

    test('user value equality', () {
      expect(const User(email: email, id: id, name: null, photo: null),
          const User(email: email, id: id, name: null, photo: null));
    });
  });
}
