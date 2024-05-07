part of 'address_selection_bloc.dart';

// Define the event for adding an address
abstract class AddressEvent {}

// Define an event for adding a new address
class AddAddressEvent extends AddressEvent {
  final Address address;

  AddAddressEvent(this.address);
}
