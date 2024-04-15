class UserModel {
  String userName;
  String email;
  String firstName;
  String lastName;
  int phoneNumber;
  Address address;
  String profilePicture;
  String password;
  List<String> wishlist;
  List<Cart> cart;
  String? userId;

  UserModel({
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.address,
    required this.profilePicture,
    required this.password,
    required this.wishlist,
    required this.cart,
    this.userId,
  });

  // Factory method to create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['UserName'] ?? "",
      email: json['Email'] ?? "",
      firstName: json['FirstName'] ?? "",
      lastName: json['LastName'] ?? "",
      phoneNumber: json['PhoneNumber'] ?? 0,
      address: Address.fromJson(json['Address'] ?? {}),
      profilePicture: json['ProfilePicture'] ?? "",
      password: json['Password'] ?? "",
      wishlist: List<String>.from(json['Wishlist'] ?? []),
      cart: (json['Cart'] as List<dynamic>?)?.map((cartJson) => Cart.fromJson(cartJson) ).toList() ?? [],
      userId: json['UserId']?? "",
    );
  }

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'UserName': userName,
      'Email': email,
      'FirstName': firstName,
      'LastName': lastName,
      'PhoneNumber': phoneNumber,
      'Address': address.toJson(),
      'ProfilePicture': profilePicture,
      'Password': password,
      'Wishlist': wishlist,
      'Cart': cart.map((cartItem) => cartItem.toJson()).toList(),
      'UserId' : userId,
    };
  }
}

class Address {
  String name;
  String street;
  String city;
  String state;
  String postalCode;
  String country;
  int phoneNumber;

  Address({
    required this.name,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.phoneNumber,
  });

  // Factory method to create Address from JSON
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      name: json['Name'] ?? "",
      street: json['Street'] ?? "",
      city: json['City'] ?? "",
      state: json['State'] ?? "",
      postalCode: json['PostalCode'] ?? "",
      country: json['Country'] ?? "",
      phoneNumber: json['PhoneNumber'] ?? "",
    );
  }

  // Convert Address to JSON
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Street': street,
      'City': city,
      'State': state,
      'PostalCode': postalCode,
      'Country': country,
      'PhoneNumber': phoneNumber,
    };
  }
}

class Cart{
  String productId;
  String quantity;

  Cart({
    required this.productId,
    required this.quantity,
  });

  factory Cart.fromJson(Map<String,dynamic> json){
    return Cart(
      productId: json['ProductId'] ?? '', 
      quantity: json['Quantity'] ?? '',);
  }

  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'Quantity': quantity,
    };
  }
}
