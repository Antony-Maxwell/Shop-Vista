import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.image,
    required this.name,
    required this.isFeatured,
    required this.parentId,
  });

  static CategoryModel empty() =>
      CategoryModel(id: '', image: '', name: '', isFeatured: false, parentId: '');

  //convert model to json
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'isFeatured': isFeatured,
    };
  }

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();

      return CategoryModel(
          id: document.id,
          image: data!['Image'] ?? '',
          name: data['Name'] ?? '',
          isFeatured: data['isFeatured'] ?? false,
          parentId: data['ParentId'] ?? '',
          );
    } else {
      return CategoryModel.empty();
    }
  }
}
