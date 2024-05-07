class UserModel {
  String userName;
  String email;
  String firstName;
  String lastName;
  int phoneNumber;
  List<Address> addresses;
  String profilePicture;
  String password;
  List<String> wishlist;
  List<Cart> cart;
  String userId;
  List<Orders> orders;

  UserModel({
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.addresses,
    required this.profilePicture,
    required this.password,
    required this.wishlist,
    required this.cart,
    required this.orders,
    required this.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['UserName'] ?? "",
      email: json['Email'] ?? "",
      firstName: json['FirstName'] ?? "",
      lastName: json['LastName'] ?? "",
      phoneNumber: json['PhoneNumber'] ?? 0,
      addresses: (json['Addresses'] as List<dynamic>?)
          ?.map((addressJson) => Address.fromJson(addressJson))
          .toList() ?? [],
      profilePicture: json['ProfilePicture'] ?? "",
      password: json['Password'] ?? "",
      wishlist: List<String>.from(json['Wishlist'] ?? []),
      cart: (json['Cart'] as List<dynamic>?)
          ?.map((cartJson) => Cart.fromJson(cartJson))
          .toList() ?? [],
      userId: json['UserId'] ?? "",
      orders: (json['Orders'] as List<dynamic>?)?.map((ordersJson) => Orders.fromJson(ordersJson)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'UserName': userName,
      'Email': email,
      'FirstName': firstName,
      'LastName': lastName,
      'PhoneNumber': phoneNumber,
      'Addresses': addresses.map((address) => address.toJson()).toList(),
      'ProfilePicture': profilePicture,
      'Password': password,
      'Wishlist': wishlist,
      'Cart': cart.map((cartItem) => cartItem.toJson()).toList(),
      'UserId': userId,
      'Orders' : orders.map((orders) => orders.toJson()).toList(),
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

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      name: json['Name'] ?? "",
      street: json['Street'] ?? "",
      city: json['City'] ?? "",
      state: json['State'] ?? "",
      postalCode: json['PostalCode'] ?? "",
      country: json['Country'] ?? "",
      phoneNumber: json['PhoneNumber'] ?? 0,
    );
  }

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

class Cart {
  String productId;
  String quantity;
  String color;
  String size;

  Cart({
    required this.productId,
    required this.quantity,
    required this.color,
    required this.size,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      productId: json['ProductId'] ?? "",
      quantity: json['Quantity'] ?? "",
      color: json['Color'] ?? "",
      size: json['Size'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'Quantity': quantity,
      'Color' : color,
      'Size' : size,
    };
  }
}

class Orders {
  String status;
  List<String> productIds;
  String orderId;
  String date;
  Address address;
  double orderTotal;

  Orders({
    required this.status,
    required this.productIds,
    required this.orderId,
    required this.date,
    required this.address,
    required this.orderTotal,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      status: json['Status'],
      productIds: List<String>.from(json['ProductIds']),
      orderId: json['OrderId'],
      date: json['Date'],
      address: Address.fromJson(json['Address']),
      orderTotal: json['OrderTotal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Status': status,
      'ProductIds': productIds,
      'OrderId': orderId,
      'Date': date,
      'Address' : address.toJson(),
      'OrderTotal' : orderTotal,
    };
  }
}
