// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/banners_bloc/banners_bloc_bloc.dart' as _i5;
import '../../../infrastructure/home/banners/banners_impl.dart' as _i4;
import '../../home/banners_repo.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i5.BannersBlocBloc>(
      () => _i5.BannersBlocBloc(get<_i3.BannersRepo>()));
  return get;
}
