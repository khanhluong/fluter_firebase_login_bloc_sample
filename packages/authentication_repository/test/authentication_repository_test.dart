import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

const _mockFirebaseUserUid = 'mock-uid';
const _mockFirebaseUserEmail = 'mock-email';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements FirebaseUser {
  @override
  String get uid => _mockFirebaseUserUid;

  @override
  String get email => _mockFirebaseUserEmail;
}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

void main() {
  const email = 'test@gmail.com';
  const password = 't0ps3cret42';

  const user = User(id: _mockFirebaseUserUid, email: _mockFirebaseUserEmail);

  group('AuthenticationRepository', () {
    FirebaseAuth firebaseAuth;
    GoogleSignIn googleSignIn;
    AuthenticationRepository authenticationRepository;

    setUp(() {
      firebaseAuth = MockFirebaseAuth();
      googleSignIn = MockGoogleSignIn();
      authenticationRepository = AuthenticationRepository(
          firebaseAuth: firebaseAuth, googleSignIn: googleSignIn);
    });

    test('creates FirebaseAuth instance internally when not injected', () {
      expect(() => AuthenticationRepository(), isNot(throwsException));
    });

    group('SignUp', () {
      test('Throw error when email is null', () {
        expect(
            () => authenticationRepository.signUp(
                email: null, password: password),
            throwsAssertionError);
      });

      test('Throw error when password is null', () {
        expect(
            () => authenticationRepository.signUp(email: email, password: null),
            throwsAssertionError);
      });

      test('calls createUserWithEmailAndPassword', () async {
        await authenticationRepository.signUp(email: email, password: password);

        verify(firebaseAuth.createUserWithEmailAndPassword(
                email: email, password: password))
            .called(1);
      });
    });
  });
}
