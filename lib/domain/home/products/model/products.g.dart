// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      categoryId: json['CategoryId'] as String?,
      productVariations: (json['ProductVariations'] as List<dynamic>?)
          ?.map((e) => ProductVariation.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      images:
          (json['Images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      productsAttributes: (json['ProductsAttributes'] as List<dynamic>?)
          ?.map((e) => ProductsAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      productType: json['ProductType'] as String?,
      title: json['Title'] as String?,
      thumbnail: json['Thumbnail'] as String?,
      brand: json['Brand'] == null
          ? null
          : Brand.fromJson(json['Brand'] as Map<String, dynamic>),
      price: (json['Price'] as num?)?.toDouble(),
      salePrice: (json['SalePrice'] as num?)?.toDouble(),
      isFeatured: json['isFeatured'] as bool?,
      sku: json['SKU'] as String?,
      stock: json['Stock'] as int?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'CategoryId': instance.categoryId,
      'ProductVariations': instance.productVariations,
      'Description': instance.description,
      'Images': instance.images,
      'ProductsAttributes': instance.productsAttributes,
      'ProductType': instance.productType,
      'Title': instance.title,
      'Thumbnail': instance.thumbnail,
      'Brand': instance.brand,
      'Price': instance.price,
      'SalePrice': instance.salePrice,
      'isFeatured': instance.isFeatured,
      'SKU': instance.sku,
      'Stock': instance.stock,
    };

ProductsAttribute _$ProductsAttributeFromJson(Map<String, dynamic> json) =>
    ProductsAttribute(
      values:
          (json['Values'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$ProductsAttributeToJson(ProductsAttribute instance) =>
    <String, dynamic>{
      'Values': instance.values,
      'Name': instance.name,
    };

ProductVariation _$ProductVariationFromJson(Map<String, dynamic> json) =>
    ProductVariation(
      description: json['Description'] as String?,
      price: (json['Price'] as num?)?.toDouble(),
      attributeValues: json['AttributeValues'] == null
          ? null
          : AttributeValues.fromJson(
              json['AttributeValues'] as Map<String, dynamic>),
      salePrice: (json['SalePrice'] as num?)?.toDouble(),
      id: json['Id'] as String?,
      image: json['Image'] as String?,
      sku: json['SKU'] as String?,
      stock: json['Stock'] as int?,
    );

Map<String, dynamic> _$ProductVariationToJson(ProductVariation instance) =>
    <String, dynamic>{
      'Description': instance.description,
      'Price': instance.price,
      'AttributeValues': instance.attributeValues,
      'SalePrice': instance.salePrice,
      'Id': instance.id,
      'Image': instance.image,
      'SKU': instance.sku,
      'Stock': instance.stock,
    };

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      id: json['Id'] as String?,
      isFeatured: json['isFeatured'] as bool?,
      image: json['Image'] as String?,
      productsCount: json['ProductsCount'] as int?,
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'Id': instance.id,
      'isFeatured': instance.isFeatured,
      'Image': instance.image,
      'ProductsCount': instance.productsCount,
      'Name': instance.name,
    };

AttributeValues _$AttributeValuesFromJson(Map<String, dynamic> json) =>
    AttributeValues(
      size: json['Size'] as String?,
      color: json['Color'] as String?,
    );

Map<String, dynamic> _$AttributeValuesToJson(AttributeValues instance) =>
    <String, dynamic>{
      'Size': instance.size,
      'Color': instance.color,
    };
