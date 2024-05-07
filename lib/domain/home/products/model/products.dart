import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  @JsonKey(name: 'CategoryId')
  String? categoryId;
  @JsonKey(name: 'ProductVariations')
  List<ProductVariation>? productVariations;
  @JsonKey(name: 'Description')
  String? description;
  @JsonKey(name: 'Images')
  List<String>? images;
  @JsonKey(name: 'ProductAttributes')
  List<ProductsAttribute>? productsAttributes;
  @JsonKey(name: 'ProductType')
  String? productType;
  @JsonKey(name: 'Title')
  String? title;
  @JsonKey(name: 'thumbnail')
  String? thumbnail;
  @JsonKey(name: 'Brand')
  Brand? brand;
  @JsonKey(name: 'Price')
  double? price;
  @JsonKey(name: 'SalePrice')
  double? salePrice;
  bool? isFeatured;
  @JsonKey(name: 'SKU')
  String? sku;
  @JsonKey(name: 'Stock')
  int? stock;
  @JsonKey(name: 'Id')
  String? id;
  @JsonKey(name: 'Reviews')
  List<Reviews>? reviews;

  Products({
    this.categoryId,
    this.productVariations,
    this.description,
    this.images,
    this.productsAttributes,
    this.productType,
    this.title,
    this.thumbnail,
    this.brand,
    this.price,
    this.salePrice,
    this.isFeatured,
    this.sku,
    this.stock,
    this.id,
    this.reviews,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return _$ProductsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}

@JsonSerializable()
class ProductsAttribute {
  @JsonKey(name: 'Values')
  List<String>? values;
  @JsonKey(name: 'Name')
  String? name;

  ProductsAttribute({this.values, this.name});

  factory ProductsAttribute.fromJson(Map<String, dynamic> json) {
    return _$ProductsAttributeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductsAttributeToJson(this);
}

@JsonSerializable()
class ProductVariation {
  @JsonKey(name: 'Description')
  String? description;
  @JsonKey(name: 'Price')
  double? price;
  @JsonKey(name: 'AttributeValues')
  AttributeValues? attributeValues;
  @JsonKey(name: 'SalePrice')
  double? salePrice;
  @JsonKey(name: 'Id')
  String? id;
  @JsonKey(name: 'Image')
  String? image;
  @JsonKey(name: 'SKU')
  String? sku;
  @JsonKey(name: 'Stock')
  int? stock;

  ProductVariation({
    this.description,
    this.price,
    this.attributeValues,
    this.salePrice,
    this.id,
    this.image,
    this.sku,
    this.stock,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json) {
    return _$ProductVariationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductVariationToJson(this);
}

@JsonSerializable()
class Brand {
  @JsonKey(name: 'Id')
  String? id;
  bool? isFeatured;
  @JsonKey(name: 'Image')
  String? image;
  @JsonKey(name: 'ProductsCount')
  int? productsCount;
  @JsonKey(name: 'Name')
  String? name;

  Brand({
    this.id,
    this.isFeatured,
    this.image,
    this.productsCount,
    this.name,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

@JsonSerializable()
class AttributeValues {
  @JsonKey(name: 'Size')
  String? size;
  @JsonKey(name: 'Color')
  String? color;

  AttributeValues({this.size, this.color});

  factory AttributeValues.fromJson(Map<String, dynamic> json) {
    return _$AttributeValuesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttributeValuesToJson(this);
}

@JsonSerializable()
class Reviews{
  @JsonKey(name: 'Date')
  String? date;
  @JsonKey(name: 'Rating')
  String? rating;
  @JsonKey(name: 'ReviewDescription')
  String? description;
  @JsonKey(name: 'UserId')
  String? userId;

  Reviews({this.date, this.description, this.rating, this.userId});

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return _$ReviewsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
}
