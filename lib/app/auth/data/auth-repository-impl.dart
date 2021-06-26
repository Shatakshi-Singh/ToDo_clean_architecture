import 'package:clean_architecture_todo/app/auth/domain/repository/auth-repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  bool checkUserSignInStatus() {
    if (_firebaseAuth.currentUser == null)
      return false;
    else
      return true;
  }

  @override
  Future<void> userSignIn(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> userSignUp(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
