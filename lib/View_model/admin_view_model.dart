import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:raktdata_app/widgets/translate_extension.dart';

import '../core/app_colors.dart';
import '../models/need_model.dart';
import '../presentation/widgets/whatsappImplementation.dart';
import '../widgets/disposable_provider.dart';
import '../widgets/util.dart';

class NeedViewModel extends DisposableProvider {
  // List<NeedModel> _categories = [];
  List<NeedModel> _needDetails = [];

  List<NeedModel> get requirementDetails => _needDetails;
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  // void deleteDocument(String documentId,bool status) async {
  //   try {
  //     setLoading(true);
  //
  //     await FirebaseFirestore.instance
  //         .collection("Need")
  //         .doc(documentId)
  //         .delete();
  //     notifyListeners();
  //     if(status=="accept"){
  //       Util.getSnackBar("Accepted", color: AppColors.lightGreen);
  //
  //     }
  //     else if(status=="reject"){
  //       Util.getSnackBar("Rejected", color: AppColors.deepRed);
  //
  //     }
  //   } catch (error) {
  //     print('Error deleting document: $error');
  //     Util.getSnackBar("Something went wrong", color: AppColors.deepRed);
  //   }finally {
  //     setLoading(false); // This line is now inside the try block
  //   }
  //   // setLoading(false);
  // }

  void deleteDocument(String documentId, bool status) async {
    try {
      setLoading(true);
print("documnetId $documentId");
      // Delete the document from Firestore
      await FirebaseFirestore.instance.collection("Need").doc(documentId).delete();

      // Delete the corresponding image from Firebase Storage
      Reference storageRef = FirebaseStorage.instance.ref().child('prescriptions/$documentId.jpg');
      await storageRef.delete();

       notifyListeners();
      setLoading(false);

      if(status) {
        Util.getSnackBar("Accepted".trTrans, color: AppColors.lightGreen);
      } else if(!status) {
        Util.getSnackBar("Rejected".trTrans, color: AppColors.deepRed);
      }
    } catch (error) {
      print('Error deleting document: $error');
      Util.getSnackBar("Something went wrong".trTrans, color: AppColors.deepRed);
    } finally {
      setLoading(false);
    }
  }

  Future<void> fetchData() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> needSnapshot =
          await FirebaseFirestore.instance.collection('Need').get();

      final List<NeedModel> fetchedNeedModels = needSnapshot.docs
          .map((doc) => NeedModel.fromJson(doc.data(),doc.id))
          .toList();

      _needDetails = fetchedNeedModels;
      print("1010101010100101");
      print(_needDetails);

      notifyListeners();
    } catch (error) {
      print("99999999999999999");
      print("Error fetching data: $error"); // Print the specific error

      Util.getSnackBar('Something went wrong.'.trTrans);
    }
  }

  @override
  void disposeValues() {
    _needDetails = [];
  }
}
