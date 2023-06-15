import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttergdsc/controllers/signup_failure.dart';
import 'package:fluttergdsc/pages/login_page.dart';
import 'package:get/get.dart';
import '../pages/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, setInitialScreen);
  }

  void setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => HomePage());
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const HomePage())
          : Get.to(() => LoginPage());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      Get.snackbar("Error creating account", ex.message,
          snackPosition: SnackPosition.BOTTOM);
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      Get.snackbar("Error creating account", ex.message,
          snackPosition: SnackPosition.BOTTOM);
      throw ex;
    }
  }

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } 
    return null;
  }

  //Google Authentication
  Future<UserCredential> signInWithGoogle() async {
    try{
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      Get.snackbar("Error sign in account", ex.message,
          snackPosition: SnackPosition.BOTTOM);
      throw ex; // Throw the exception to be caught and handled properly
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      Get.snackbar("Error sign in account", ex.message,
          snackPosition: SnackPosition.BOTTOM);
      throw ex;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
