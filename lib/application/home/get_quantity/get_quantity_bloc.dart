import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_quantity_event.dart';
part 'get_quantity_state.dart';

class CartQty extends Bloc<GetQuantityEvent, GetQuantityState> {
  CartQty() : super(GetQuantityInitial());
  decrement(int qty) {
    log('in decr bloc $qty');
    return qty--;
  }
}
