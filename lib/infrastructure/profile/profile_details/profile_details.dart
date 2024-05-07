import 'package:cloud_firestore/cloud_firestore.dart';


class UpdateProfileDetails{
void updateField(String documentId, String feild, dynamic value) async {
  // Get a reference to the document you want to update
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection('Users').doc(documentId);

  // Use the update method to modify specific fields
  documentReference.update({
    feild : value,
    // You can add more fields to update here
  }).then((_) {
    print("Field updated successfully");
  }).catchError((error) {
    print("Error updating field: $error");
  });
}
}
