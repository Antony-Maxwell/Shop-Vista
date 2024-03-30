import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:shop_vista/domain/categories/model/categories_model.dart';

class CategoryRepository{
  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>>getAllCategories()async{
    try{
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    }on FirebaseException catch(e){
      throw e;
    }on PlatformException catch (e){
      throw e;
    }catch (e){
      throw 'Something bad happened';
    }
  }
}