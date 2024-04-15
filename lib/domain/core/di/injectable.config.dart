// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/home/banners_bloc/banners_bloc_bloc.dart' as _i16;
import '../../../application/home/get_cart/get_cart_bloc.dart' as _i18;
import '../../../application/home/get_wishlist/getwishlist_bloc.dart' as _i11;
import '../../../application/home/products/products_bloc.dart' as _i19;
import '../../../application/home/user_bloc/user_bloc.dart' as _i20;
import '../../../application/store/brand_bloc/brand_bloc.dart' as _i17;
import '../../../infrastructure/home/banners/banners_impl.dart' as _i4;
import '../../../infrastructure/home/products/products_impl.dart' as _i13;
import '../../../infrastructure/store/brand/brand_impl.dart' as _i6;
import '../../../infrastructure/user_detail_imp/cart/get_cart_impl.dart' as _i8;
import '../../../infrastructure/user_detail_imp/user_detail_impl.dart' as _i15;
import '../../../infrastructure/user_detail_imp/wishlist/get_wishlist_impl.dart'
    as _i10;
import '../../home/banners/banners_repo.dart' as _i3;
import '../../home/brand/brand_service.dart' as _i5;
import '../../home/products/products_services.dart' as _i12;
import '../../User/cart/cart_service.dart' as _i7;
import '../../User/users_repository.dart' as _i14;
import '../../User/wishlist/wishlist_service.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i9.GetWishlistService>(
      () => _i10.GetWishlistImplementation());
  gh.factory<_i11.GetwishlistBloc>(
      () => _i11.GetwishlistBloc(get<_i9.GetWishlistService>()));
  gh.lazySingleton<_i12.ProductsServices>(() => _i13.ProductsImplementation());
  gh.lazySingleton<_i14.UsersService>(() => _i15.UserDetailsImplementation());
  gh.factory<_i16.BannersBlocBloc>(
      () => _i16.BannersBlocBloc(get<_i3.BannersRepo>()));
  gh.factory<_i17.BrandBloc>(() => _i17.BrandBloc(get<_i5.BrandServices>()));
  gh.factory<_i18.GetCartBloc>(
      () => _i18.GetCartBloc(get<_i7.GetCartService>()));
  gh.factory<_i19.ProductsBloc>(
      () => _i19.ProductsBloc(get<_i12.ProductsServices>()));
  gh.factory<_i20.UserBloc>(() => _i20.UserBloc(get<_i14.UsersService>()));
  return get;
}
