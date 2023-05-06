import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> loginUser(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          return "E-mail inválido";
        case "user-not-found":
          return "O e-mail não está cadastrado";
        case "wrong-password":
          return "Senha incorreta";
      }
      return e.code;
    }
    return null;
  }

  Future<String?> createUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return "O e-mail já está em uso.";
          case "weak-password":
          return "Senha muito fraca.\nA senha deve conter pelo menos 6 dígitos.";
      }
      return e.code;
    }
    return null;
  }

  Future<String?> sendPasswordReset({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return "E-mail não cadastrado.";
      }
      return e.code;
    }
    return null;
  }
}
