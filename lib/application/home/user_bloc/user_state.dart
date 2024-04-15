part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    required UserModel user,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory UserState.initial() => UserState(
        hasError: false,
        isLoading: false,
        user: UserModel(
          userId: '',
          userName: '',
          email: '',
          firstName: '',
          lastName: '',
          phoneNumber: 0,
          address: Address(
              name: '',
              street: '',
              city: '',
              state: '',
              postalCode: '',
              country: '',
              phoneNumber: 0),
          profilePicture: '',
          password: '',
          wishlist: [],
          cart: [],
        ),
      );
}
