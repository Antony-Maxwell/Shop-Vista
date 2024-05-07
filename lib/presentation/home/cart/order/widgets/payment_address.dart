import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/application/profile/address_selection/address_selection_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/infrastructure/upi/upi_integration.dart';
import 'package:shop_vista/presentation/profile/settings_screens/add_new_address.dart';
import 'package:shop_vista/presentation/profile/settings_screens/my_address.dart';
import 'package:uuid/uuid.dart';

class PaymentAndAddress extends StatelessWidget {
  const PaymentAndAddress({
    super.key,
    required this.totalPrice,
    required this.shippingfee,
    required this.tax,
    required this.discountamt,
    required this.total,
    required this.address,
    required this.userState,
    required this.isAddressEmpty,
  });

  final double totalPrice;
  final int shippingfee;
  final int tax;
  final int discountamt;
  final int total;
  final Address address;
  final UserState userState;
  final bool isAddressEmpty;

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   BlocProvider.of<GetCartBloc>(context).add(GetCartEvent.getCartList(
    //       userState.user.userId!, totalPrice, total + totalPrice));
    // });
    // double subtotal = totalPrice;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Subtotal',
              style: TextStyle(fontSize: 16),
            ),
            Text('\$$totalPrice',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ],
        ),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Shipping fee', style: TextStyle(fontSize: 16)),
            Text('\$$shippingfee',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Tax fee', style: TextStyle(fontSize: 16)),
            Text('\$$tax',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Delivery',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '\$$discountamt',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Order Total',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${total + totalPrice}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          color: Colors.black,
        ),
        kHeight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        BlocBuilder<GetCartBloc, GetCartState>(
          builder: (context, state) {
              String generateOrderId() {
              var uuid = Uuid();
              return uuid.v4();
            }
            return BlocBuilder<UserBloc, UserState>(
              builder: (context, userstate) {
                final id = generateOrderId();
                return Container(
                  color: Colors.grey.shade300,
                  height: 230,
                  child: UpiBottomSheet(
                    orderTotal: state.totalPrice,
                    userId: userState.user.userId!,
                      cartItems: state.cart!, orderId: id),
                );
              },
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Shipping Address',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            isAddressEmpty?
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewAddressScreen(),));
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
            :
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyAddressScreen(),)),
              child: const Text(
                'Change',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
        kHeight,
        isAddressEmpty
        ?
        const Center(child: Text('No address added yet.....!'),)
        :
        BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {
            if(state.address != null){
              final address = state.address;
            return Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 42,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${address!.postalCode}, ${address.city}, ${address.country} ',
                        ),
                        Text(
                          address.name,
                        ),
                      ],
                    )
                  ],
                );
          }else{
            return Center(child: Text('No address added yet.....!'),);
          }
          }
        ),
        kHeight,
        Row(
          children: [
            const Icon(
              Icons.phone,
              size: 34,
            ),
            Text(userState.user.phoneNumber.toString()),
          ],
        )
      ],
    );
  }
}
