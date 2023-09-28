

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
// import 'package:raktdata_app/View_model/auth_admin_credentials_vew_model.dart';
import 'package:raktdata_app/core/app_string.dart';
import 'package:raktdata_app/presentation/Frontpage/FrontPage.dart';
import 'package:raktdata_app/widgets/translate_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../enums/user_role.dart';
import '../models/user_models.dart';
import '../presentation/adminPage/adminPage.dart';
import '../widgets/auth_helper.dart';
import '../widgets/disposable_provider.dart';
import '../widgets/splash_screen.dart';
import '../widgets/util.dart';

class AuthAdminViewModel extends DisposableProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _adminCollection =
  FirebaseFirestore.instance.collection('admin');
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<void> storeUserInfo( String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString('name', name);
    await prefs.setString('email', email);
  }

  Future<void> login(String email, String password) async {
    setLoading(true);
    try {
      QuerySnapshot querySnapshot = await _adminCollection
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();
      print(querySnapshot.docs);
      print("*********************");
      if (querySnapshot.docs.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        await storeUserInfo(email);
        await AuthHelper.setLoggedIn(true);
        currentUserRole = UserRole.admin; // Set user role to admin
// Set login status
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setBool('isLoggedIn', true);
        Get.offAll(() =>AdminPage());
      } else {
        print("00000000000000000");

        print(querySnapshot.docs);
        Util.getSnackBar('Please check your Email and Password'.trTrans);
        // print(e);
      }
    } catch (e) {
      print('Error logging in: $e');
    }
    notifyListeners();
    setLoading(false);
  }

  Future<void> signOut() async {
    setLoading(true);
    try {
      await _auth.signOut();
      Provider.of<AuthAdminViewModel>(Get.context!, listen: false).disposeValues();
      currentUserRole = UserRole.none;
      notifyListeners();
      await AuthHelper.setLoggedIn(false);
// Set user role to admin
      Get.offAll(() => FrontPage());
    } catch (e) {
      Util.getSnackBar(AppStrings.somethingWentWrongPleaseTryAgainLater.trTrans);
      print('Error signing out: $e');
    }
    setLoading(false);
  }



  @override
  void disposeValues() {
    _loading = false;
  }
}
