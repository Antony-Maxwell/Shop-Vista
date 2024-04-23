import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_vista/domain/User/users_repository.dart';
import 'package:shop_vista/domain/core/main_failures.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersService _usersService;
  UserBloc(this._usersService) : super(UserState.initial()) {
    on<LoadUserDetails>((event, emit) async{
      emit(
        state.copyWith(
          isLoading: true,
          hasError: false,
          user: UserModel(userName: '', email: '', firstName: '', lastName: '', phoneNumber: 0, addresses:[ Address(name: '', street: '', city: '', state: '', postalCode: '', country: '', phoneNumber: 0)], profilePicture: '', password: '', wishlist: [], cart: [], orders: [], userId: '')
        )
      );
      final Either<MainFailure, UserModel> userOption = await _usersService.getUserDetails();
      print(userOption.toString());
      emit(
        userOption.fold((failure) {
          return state.copyWith(
            isLoading: false,
            hasError: true,
          );
        }, (success) {
          print('user id is ///////////////////..............................${success.userId}');
          return state.copyWith(
            isLoading: false,
            user: success,
            hasError: false,
          );
        })
      );
    });
  }
}
