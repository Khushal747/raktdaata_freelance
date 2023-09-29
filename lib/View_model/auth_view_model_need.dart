import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:raktdata_app/core/app_colors.dart';
import 'package:raktdata_app/presentation/Frontpage/FrontPage.dart';
import 'package:raktdata_app/presentation/homePage/homePage.dart';
import 'package:raktdata_app/widgets/translate_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:raktdata_app/presentation/donor_login_signUp/donor_login.dart';
import '../core/app_string.dart';
import '../models/donor_model.dart';
import '../presentation/widgets/whatsappImplementation.dart';
import '../widgets/disposable_provider.dart';
import '../widgets/splash_screen.dart';
import '../widgets/util.dart';
import 'donor_view_model.dart';

class AuthViewModelNeed extends DisposableProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _needCollection =
      FirebaseFirestore.instance.collection('Need');
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }


  Future<void> signUp(
    String patientName,
    String disease,
    String hospitalName,
    String mobileNumber,
    String city,
    String bloodGroup,
    DateTime date,
    String bloodUnits,
    String attendersName,
    File? prescription,
      // User? currentU,
      ) async {
    try {
       setLoading(true);
      print("entered try ");
      if (!validateIndianPhoneNumber(mobileNumber)) {
        Util.getSnackBar('Please enter valid mobile number'.trTrans);
        return;
      }

      if (mobileNumber.length != 10) {
        Util.getSnackBar('Please enter valid mobile number'.trTrans);
        return;
      }
// Check file size
//       if (prescription!.lengthSync() > 3 * 1024 * 1024) {
//         Util.getSnackBar('Please select a file with size less than 3MB'.trTrans);
//         return;
//       }
//
//       // Check file format
//       String extension = prescription.path.split('.').last.toLowerCase();
//       if (extension != 'jpg') {
//         Util.getSnackBar('Please select a file in jpg format'.trTrans);
//         return;
//       }

      if (prescription == null) {
        Util.getSnackBar('Please choose a file'.trTrans);
        return;
      }

      if (!validatePatientName(patientName)) {
        Util.getSnackBar('Please enter valid name'.trTrans);
        return;
      }

      if (disease.isEmpty) {
        Util.getSnackBar('Please enter disease'.trTrans);
        return;
      }

      if (bloodUnits.isEmpty) {
        Util.getSnackBar('Please enter blood Unit'.trTrans);
        return;
      }

      if (bloodGroup == AppStrings.NA) {
        Util.getSnackBar('Please select your blood group'.trTrans);
        return;
      }

      if (!validateAttenderName(attendersName)) {
        Util.getSnackBar('Please enter attender name'.trTrans);
        return;
      }

      if (!validateHospitalName(hospitalName)) {
        Util.getSnackBar('Please enter hospital name'.trTrans);
        return;
      }

      if (!validateCityName(city)) {
        Util.getSnackBar('Please enter valid city name'.trTrans);
        return;
      }

      print("hellllo");
      final user = _auth.currentUser;
      // print("user$user");
      // if (user != null) {
      //   print("entered needData");

        // Construct needData with validations
        final needData = {
          'patientName': patientName,
          'disease': disease,
          'hospitalName': hospitalName,
          'mobileNumber': mobileNumber,
          'city': city,
          'bloodGroup': bloodGroup,
          'date': date,
          'bloodUnits': bloodUnits,
          'attendersName': attendersName,
          // 'prescription':prescription,
        };
        // final needData = {
        //   if (validatePatientName(patientName)) 'patientName': patientName,
        //   if (disease.isNotEmpty) 'disease': disease,
        //   if (validateHospitalName(hospitalName)) 'hospitalName': hospitalName,
        //   if (validateIndianPhoneNumber(mobileNumber)) 'mobileNumber': mobileNumber,
        //   if (validateCityName(city)) 'city': city,
        //   if (bloodGroup != AppStrings.NA) 'bloodGroup': bloodGroup,
        //   if (bloodUnits.isNotEmpty) 'bloodUnits': bloodUnits,
        //   if (validateAttenderName(attendersName)) 'attendersName': attendersName,
        //   'date': date, // Assuming date is always provided
        // };

        // final invalidFields = needData.entries.where((entry) => entry.value == null || entry.value == '');
        // All fields have valid values, proceed with other operations

        // Add a reference to the prescription file
        // try {
        //   print("enterd try1");
        //
        //   final prescriptionUrl = await uploadPrescription(user.uid, prescription);
        //   needData['prescriptionUrl'] = prescriptionUrl;
        //   print("uploaded then ehat");
        // } catch (error) {
        //   print('Error uploading prescription: $error');
        // }

        print("222222222222222222222222222");
        print('Generated needData: $needData');

        // Get the generated document ID
      // await _needCollection.doc(user.uid).set(needData);
      try {
        final newDocRef = _needCollection.doc();
        await newDocRef.set(needData);
        String docId = newDocRef.id;
        print("docId");
        print(docId);

        print("entered try1");
        if (prescription != null) {
          final prescriptionUrl = await uploadPrescription(docId, prescription);
          // needData['prescriptionUrl'] = prescriptionUrl;
          await newDocRef.update({'prescriptionUrl': prescriptionUrl});
          print("Prescription URL uploaded successfully.");
          print(prescriptionUrl);
        }

        //function to send messages
        // List<String> phoneNumbers = ['917477015841', '918770820133', '919399767395'];
        // await sendWhatsAppMessage(phoneNumbers);

          await sendWhatsAppMessage();

        Util.getSnackBar(
          'You have successfully registered!'.trTrans,
          color: AppColors.lightGreen,
          // Set the text color
        );
        // Assuming you have a ViewModel instance
        // Stream<List<DonorModel>> aPositiveDonorsStream =
        // DonorListViewModel().getDonorsByBloodGroup('A+');
        //below is the code to call below 2 numbers

    //     DonorListViewModel().getDonorsByBloodGroup(bloodGroup).listen((List<DonorModel> donors) {
    // List<String> mobileNumbers = donors.map((donor) => donor.mobileNumber).toList();});

        // aPositiveDonorsStream.listen((donors) {
        //   // Do something with the list of donors
        //   // For example, update UI, perform calculations, etc.
        //   print('Received ${donors.length} A+ donors.');
        //   for (var donor in donors) {
        //     print('Name: ${donor.name}, Number: ${donor.number}');
        //   }
        // });
        Get.off(() => FrontPage());
        setLoading(false);


      } catch (error) {
        print('Error uploading prescription: $error');
      }finally {
        setLoading(false);
      }

      // }
    } catch (e) {
      String errorMessage = 'Error signing up. Please try again.'.trTrans;
      Util.getSnackBar(errorMessage);
      print('Error signing up: $e');
    }
    setLoading(false);

  }

  Future<String> uploadPrescription(String userId, File prescription) async {
    try {
      // print("bbbbbbbbbbbbbbb");
      //  String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
       // String fileName = '$userId$timestamp.jpg';


       String fileName = '$userId.jpg'; // Customize the file name if needed
      Reference storageReference =
          FirebaseStorage.instance.ref().child('prescriptions/$fileName');
      UploadTask uploadTask = storageReference.putFile(prescription);

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      print("aaaaaaaaaaaaaaaaaaa");
      print(downloadUrl);
      print("downloadUrl");
      return downloadUrl;
    } catch (e) {
      print('Error uploading file to Firebase Storage: $e');
      throw e; // You can handle the error as needed
    }
  }

  bool validateIndianPhoneNumber(String phoneNumber) {
    // Define a regular expression pattern for Indian phone numbers
    RegExp regex = RegExp(r'^[6789]\d{9}$');

    // Use the hasMatch method to check if the input matches the pattern
    return regex.hasMatch(phoneNumber);
  }

  bool validatePatientName(String name) {
    // Define a regular expression pattern for names (alphabetic characters only)
    RegExp regex = RegExp(r'^[a-zA-Z ]+$');

    // Use the hasMatch method to check if the input matches the pattern
    return regex.hasMatch(name) && name.isNotEmpty && name.length >= 3;
  }

  bool validateHospitalName(String hospitalName) {
    // Define a regular expression pattern for names (alphabetic characters only)
    RegExp regex = RegExp(r'^[a-zA-Z ]+$');

    // Use the hasMatch method to check if the input matches the pattern
    return regex.hasMatch(hospitalName) &&
        hospitalName.isNotEmpty &&
        hospitalName.length >= 3;
  }

  bool validateAttenderName(String attenderName) {
    // Define a regular expression pattern for names (alphabetic characters only)
    RegExp regex = RegExp(r'^[a-zA-Z ]+$');

    // Use the hasMatch method to check if the input matches the pattern
    return regex.hasMatch(attenderName) &&
        attenderName.isNotEmpty &&
        attenderName.length >= 3;
  }

  bool validateCityName(String city) {
    // Define a regular expression pattern for city names in India
    RegExp regex = RegExp(r'^[a-zA-Z ]+$');

    // Check if the input matches the pattern and is not empty
    return regex.hasMatch(city) && city.isNotEmpty;
  }

  @override
  void disposeValues() {
    _loading = false;
  }
}
