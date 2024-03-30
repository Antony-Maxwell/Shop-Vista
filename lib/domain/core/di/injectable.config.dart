// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/home/banners_bloc/banners_bloc_bloc.dart' as _i7;
import '../../../application/home/products/products_bloc.dart' as _i8;
import '../../../infrastructure/home/banners/banners_impl.dart' as _i4;
import '../../../infrastructure/home/products/products_impl.dart' as _i6;
import '../../home/banners/banners_repo.dart' as _i3;
import '../../home/products/products_services.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i5.ProductsServices>(() => _i6.ProductsImplementation());
  gh.factory<_i7.BannersBlocBloc>(
      () => _i7.BannersBlocBloc(get<_i3.BannersRepo>()));
  gh.factory<_i8.ProductsBloc>(
      () => _i8.ProductsBloc(get<_i5.ProductsServices>()));
  return get;
}
