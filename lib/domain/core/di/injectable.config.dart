// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/home/banners_bloc/banners_bloc_bloc.dart' as _i19;
import '../../../application/home/get_cart/get_cart_bloc.dart' as _i21;
import '../../../application/home/get_wishlist/getwishlist_bloc.dart' as _i13;
import '../../../application/home/products/products_bloc.dart' as _i22;
import '../../../application/home/user_bloc/user_bloc.dart' as _i23;
import '../../../application/profile/Orders/orders_bloc.dart' as _i14;
import '../../../application/store/brand_bloc/brand_bloc.dart' as _i20;
import '../../../infrastructure/home/banners/banners_impl.dart' as _i4;
import '../../../infrastructure/home/products/products_impl.dart' as _i16;
import '../../../infrastructure/profile/orders/get_orders_impl.dart' as _i10;
import '../../../infrastructure/store/brand/brand_impl.dart' as _i6;
import '../../../infrastructure/user_detail_imp/cart/get_cart_impl.dart' as _i8;
import '../../../infrastructure/user_detail_imp/user_detail_impl.dart' as _i18;
import '../../../infrastructure/user_detail_imp/wishlist/get_wishlist_impl.dart'
    as _i12;
import '../../home/banners/banners_repo.dart' as _i3;
import '../../home/brand/brand_service.dart' as _i5;
import '../../home/products/products_services.dart' as _i15;
import '../../User/cart/cart_service.dart' as _i7;
import '../../User/orders/order_service.dart' as _i9;
import '../../User/users_repository.dart' as _i17;
import '../../User/wishlist/wishlist_service.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.BannersRepo>(() => _i4.BannersRepository());
  gh.lazySingleton<_i5.BrandServices>(() => _i6.BrandsImplements());
  gh.lazySingleton<_i7.GetCartService>(() => _i8.GetCartImplementation());
  gh.lazySingleton<_i9.GetOrdersService>(() => _i10.GetOrdersImplementation());
  gh.lazySingleton<_i11.GetWishlistService>(
      () => _i12.GetWishlistImplementation());
  gh.factory<_i13.GetwishlistBloc>(
      () => _i13.GetwishlistBloc(get<_i11.GetWishlistService>()));
  gh.factory<_i14.OrdersBloc>(
      () => _i14.OrdersBloc(get<_i9.GetOrdersService>()));
  gh.lazySingleton<_i15.ProductsServices>(() => _i16.ProductsImplementation());
  gh.lazySingleton<_i17.UsersService>(() => _i18.UserDetailsImplementation());
  gh.factory<_i19.BannersBlocBloc>(
      () => _i19.BannersBlocBloc(get<_i3.BannersRepo>()));
  gh.factory<_i20.BrandBloc>(() => _i20.BrandBloc(get<_i5.BrandServices>()));
  gh.factory<_i21.GetCartBloc>(
      () => _i21.GetCartBloc(get<_i7.GetCartService>()));
  gh.factory<_i22.ProductsBloc>(
      () => _i22.ProductsBloc(get<_i15.ProductsServices>()));
  gh.factory<_i23.UserBloc>(() => _i23.UserBloc(get<_i17.UsersService>()));
  return get;
}
