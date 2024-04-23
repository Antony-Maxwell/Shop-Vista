import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:shop_vista/domain/categories/model/categories_model.dart';

class CategoryRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
          print(list[0].parentId);
      return list;
    } on FirebaseException {
      rethrow;
    } on PlatformException {
      rethrow;
    } catch (e) {
      throw 'Something bad happened';
    }
  }
}
