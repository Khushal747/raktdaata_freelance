import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/donor_model.dart';


class DonorListViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<DonorModel>> getDonorsByBloodGroup(String bloodGroup) {
    return _firestore
        .collection('donor')
        .where('bloodGroup', isEqualTo: bloodGroup) // Filter by blood group
        .orderBy('mobileNumber')
        .snapshots()
        .map((querySnapshot) {
      final donors = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return DonorModel(
          name: data['name'],
          mobileNumber: data['mobileNumber'],
          bloodGroup: data['bloodGroup'],
        );
      }).toList();
      return donors;
    });
  }
}


// DonorListViewModel().getDonorsByBloodGroup('A+').listen((List<DonorModel> donors) {
//     List<String> mobileNumbers = donors.map((donor) => donor.mobileNumber).toList();});
//     print('Mobile Numbers: $mobileNumbers');

//to call Stream<List<DonorModel>> aPositiveDonorsStream = DonorListViewModel().getDonorsByBloodGroup('A+');