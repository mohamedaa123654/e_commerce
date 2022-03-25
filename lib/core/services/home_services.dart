import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference _productsCollectionRef =
      FirebaseFirestore.instance.collection('Products');
  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProducts() async {
    var value = await _productsCollectionRef.get();
    print('XXXXXXXXXXXXXXXXXXXXXXXXXXXXX servier p ${value.docs.length}');
    return value.docs;
  }
}
