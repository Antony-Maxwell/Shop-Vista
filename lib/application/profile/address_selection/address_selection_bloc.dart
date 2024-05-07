import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';

part 'address_selection_event.dart';
part 'address_selection_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressState(null)) {
    on<AddAddressEvent>(_onAddAddress);
  }

  void _onAddAddress(AddAddressEvent event, Emitter<AddressState> emit) {
    emit(AddressState(event.address));
  }
  
}
