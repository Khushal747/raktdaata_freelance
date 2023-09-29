

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:raktdata_app/core/app_colors.dart';
import 'package:raktdata_app/core/app_string.dart';
import 'package:raktdata_app/presentation/Frontpage/FrontPage.dart';
import 'package:raktdata_app/widgets/translate_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:raktdata_app/presentation/donor_login_signUp/donor_login.dart';
import '../enums/user_role.dart';
import '../models/user_models.dart';
import '../widgets/auth_helper.dart';
import '../widgets/disposable_provider.dart';
import '../widgets/splash_screen.dart';
import '../widgets/util.dart';

class AuthViewModel extends DisposableProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _donorsCollection =
  FirebaseFirestore.instance.collection('donor');
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<void> updateBloodDonationDate( DateTime? bloodDonationDate) async {
    try {
      await _donorsCollection.doc(_auth.currentUser?.uid).update({'bloodDonationDate': bloodDonationDate});
      Util.getSnackBar("Successfully Updated".trTrans,color: AppColors.lightGreen);
    } catch (e) {
      Util.getSnackBar("Error updating blood donation date".trTrans);

      print('Error updating blood donation date: $e');

    }
  }

  // String getCurrentUserUid() {
  //   return _auth.currentUser?.uid ?? '';
  // }
  Future<void>signUp(
      String name,
      String email,
      String city,
      String mobileNumber,
      String bloodGroup,
      DateTime ?bloodDonationDate,
      String password,
      String confirmPassword,

      ) async {
    try {


      if (password != confirmPassword) {
        Util.getSnackBar('Password and Confirm Password do not match.'.trTrans);
        return;
      }

      if (!isEmailValid(email)) {
        Util.getSnackBar('Please enter a valid email.'.trTrans);
        return;
      }

      if (!validateIndianPhoneNumber(mobileNumber)) {
        Util.getSnackBar('Please enter valid mobile number'.trTrans);
        return;

      }

      if (!validateName(name)) {
        Util.getSnackBar('Please enter valid name'.trTrans);
        return;

      }

      if (!validateCityName(city)) {
        Util.getSnackBar('Please enter valid  city name'.trTrans);
        return;

      }

      if (bloodGroup==AppStrings.NA) {
        Util.getSnackBar('Please select your blood group'.trTrans);
        return;

      }

      if (bloodDonationDate == null) {

        bloodDonationDate=null;
      }


      if (password.length < 6) {
        Util.getSnackBar('Password should be at least 6 characters long.'.trTrans);
        return;
      }

      if (name.isEmpty) {
        Util.getSnackBar('Name cannot be empty.'.trTrans);
        return;
      }

      setLoading(true);
      UserCredential donorCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );


      await _donorsCollection.doc(donorCredential.user!.uid).set({

        'name': name,
        'password': password,
        'city': city,
        'email': email,
        'bloodGroup': bloodGroup,
        'bloodDonationDate': bloodDonationDate,
        'mobileNumber':mobileNumber,
      });
      Get.off(() => DonorLogin());
    } catch (e) {
      String errorMessage = 'Error signing up. Please try again.'.trTrans;

      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'email-already-in-use':
            errorMessage = 'email is already registered.'.trTrans;
            break;
          case 'weak-password':
            errorMessage = 'Password is too weak.'.trTrans;
            break;
        }
      }
      Util.getSnackBar(errorMessage);
      print('Error signing up: $e');
    }
    setLoading(false);

  }

  bool isEmailValid(String email) {
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

    return emailRegex.hasMatch(email);
  }

  bool validateIndianPhoneNumber(String phoneNumber) {
    // Define a regular expression pattern for Indian phone numbers
    RegExp regex = RegExp(r'^[6789]\d{9}$');

    // Use the hasMatch method to check if the input matches the pattern
    return regex.hasMatch(phoneNumber);
  }

  bool validateName(String name) {
    // Define a regular expression pattern for names (alphabetic characters only)
    RegExp regex = RegExp(r'^[a-zA-Z ]+$');

    // Use the hasMatch method to check if the input matches the pattern
    return regex.hasMatch(name) &&  name.isNotEmpty && name.length >= 3;
  }

  bool validateCityName(String city) {
    // Define a regular expression pattern for city names in India
    RegExp regex = RegExp(r'^[a-zA-Z ]+$');

    // Check if the input matches the pattern and is not empty
    return regex.hasMatch(city) && city.isNotEmpty;
  }

  Future<void> storeUserInfo( String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString('name', name);
    await prefs.setString('email', email);
  }

  Future<void> login(String email, String password) async {
    setLoading(true);
    try {
      QuerySnapshot querySnapshot = await _donorsCollection
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        //  SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setBool('isLoggedIn', true);
        await storeUserInfo(email);
        await AuthHelper.setLoggedIn(true); // Set login status
        currentUserRole = UserRole.donor;
        Get.offAll(() => SplashScreen());
      } else {
        Util.getSnackBar('Please check your Email and Password'.trTrans);
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
      Provider.of<AuthViewModel>(Get.context!, listen: false).disposeValues();
      currentUserRole = UserRole.none; // Set user role to admin
      await AuthHelper.setLoggedIn(false); // Set login status

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
