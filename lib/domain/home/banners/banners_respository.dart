import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'banners_respository.freezed.dart';
part 'banners_respository.g.dart';
@freezed
class Banners with _$Banners{
  const factory Banners({
    required String imageUrl,
  }) = _Banners;

  static Banners empty()=> const Banners(imageUrl: '');

  factory Banners.fromJson(Map<String, dynamic> json) => _$BannersFromJson(json);

  factory Banners.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    if(document.data() != null){
      final data = document.data();
      return Banners(imageUrl: data!['Image'] ?? '');
    }else{
      return Banners.empty();
    }
  }
}