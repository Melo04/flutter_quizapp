import 'package:fluttergdsc/controllers/user_model.dart';
import 'package:get/get.dart';
import 'authentication_repo.dart';
import 'user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return _userRepo.getUserDetails(email);
    }else{
      Get.snackbar("Error", "Login to continue");
    }
  }

  //Fetch list of user records
  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}