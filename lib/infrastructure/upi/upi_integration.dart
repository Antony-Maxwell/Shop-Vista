import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/application/profile/address_selection/address_selection_bloc.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/payment_success.dart';
import 'package:shop_vista/presentation/widgets/navigation_menu.dart';
import 'package:upi_india/upi_india.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class UpiBottomSheet extends StatefulWidget {
  final orderId;
  const UpiBottomSheet(
      {required this.orderId,
      super.key,
      required this.cartItems,
      required this.userId, required this.orderTotal});
  final List<Cart> cartItems;
  final String userId;
  final double orderTotal;

  @override
  State<UpiBottomSheet> createState() => _UpiBottomSheetState();
}

class _UpiBottomSheetState extends State<UpiBottomSheet> {
  final _razorpay = Razorpay();

  Future<UpiResponse>? _transaction;
  final UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  TextStyle header = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentSuccessScreen(),
        ),
        (route) => false);
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    print('payment success');
    await updateDummyOrderToFirebase();
    await clearCartForUser(userId!);
  }

  Future<void> updateDummyOrderToFirebase() async {
    List<String> productIds = [];
    for (var cart in widget.cartItems) {
      productIds.add(cart.productId);
    }
    // Create a dummy order data
    DateTime selectedDate = DateTime.now();
    String formattedDate =
        "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";

    final userAddress = context.read<AddressBloc>();
    final address = Address(
        name: userAddress.state.address!.name,
        street: userAddress.state.address!.street,
        city: userAddress.state.address!.city,
        state: userAddress.state.address!.state,
        postalCode: userAddress.state.address!.postalCode,
        country: userAddress.state.address!.country,
        phoneNumber: userAddress.state.address!.phoneNumber);

        final addressJson = address.toJson();
    Map<String, dynamic> dummyOrderData = {
      'Status': 'Pending',
      'ProductIds': productIds,
      'OrderId': widget.orderId,
      'Date': formattedDate,
      'Address': addressJson,
      'OrderTotal' : widget.orderTotal,
    };

    // Get current user ID from FirebaseAuth
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    // Update the order data to Firebase
    if (userId != null) {
      try {
        DocumentSnapshot userDocSnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .get();
        List<dynamic> existingOrders =
            (userDocSnapshot.data() as Map<String, dynamic>)['Orders'] ?? [];
        existingOrders.add(dummyOrderData);
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .update({'Orders': existingOrders});

        print('Dummy order data updated successfully');
      } catch (e) {
        print('Failed to update dummy order data: $e');
      }
    } else {
      print('No user is currently logged in');
    }
  }

  Future<void> clearCartForUser(String userId) async {
    // Get a reference to the document for the specific user
    DocumentReference userRef =
        FirebaseFirestore.instance.collection('Users').doc(userId);

    // Update the "cart" field to an empty list
    await userRef.update({'Cart': []});
    // Alternatively, delete the "cart" field
    // await userRef.update({'cart': FieldValue.delete()});
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('payment error');
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "athulkrishna9633141960@okaxis",
      receiverName: 'Shop Vista',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: 1.00,
    );
  }

  Widget displayUpiApps() {
    if (apps == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (apps!.isEmpty)
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    else {
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  _transaction = initiateTransaction(app);
                  setState(() {});
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.memory(
                        app.icon,
                        height: 60,
                        width: 60,
                      ),
                      Text(app.name),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
            body,
            style: value,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              height: 250,
              child: Column(
                children: [
                  displayUpiApps(),
                  BlocBuilder<GetCartBloc, GetCartState>(
                    builder: (context, state) {
                      final totalBefore = state.totalPrice + 35;
                      final totalAfter = totalBefore * 100;
                      return GestureDetector(
                        onTap: () {
                          var options = {
                            'key': 'rzp_test_8I0BLsGDT4H0Yd',
                            'amount': totalAfter,
                            'name': 'Shop Vista',
                            'description': 'Fine T-Shirt',
                            'timeout': 60, // in seconds
                            'prefill': {
                              'contact': '9000090000',
                              'email': 'shopVista@co.com'
                            }
                          };
                          _razorpay.open(options);
                        },
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: Image.asset(
                            "assets/rzrpay.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  const Text('RazorPay'),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _transaction,
              builder:
                  (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        _upiErrorHandler(snapshot.error.runtimeType),
                        style: header,
                      ), // Print's text message on screen
                    );
                  }

                  // If we have data then definitely we will have UpiResponse.
                  // It cannot be null
                  UpiResponse upiResponse = snapshot.data!;

                  // Data in UpiResponse can be null. Check before printing
                  String txnId = upiResponse.transactionId ?? 'N/A';
                  String resCode = upiResponse.responseCode ?? 'N/A';
                  String txnRef = upiResponse.transactionRefId ?? 'N/A';
                  String status = upiResponse.status ?? 'N/A';
                  String approvalRef = upiResponse.approvalRefNo ?? 'N/A';
                  _checkTxnStatus(status);

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        displayTransactionData('Transaction Id', txnId),
                        displayTransactionData('Response Code', resCode),
                        displayTransactionData('Reference Id', txnRef),
                        displayTransactionData('Status', status.toUpperCase()),
                        displayTransactionData('Approval No', approvalRef),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(''),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    // TODO: implement dispose
    super.dispose();
  }
}
