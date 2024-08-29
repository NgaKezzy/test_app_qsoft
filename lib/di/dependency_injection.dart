import 'package:get_it/get_it.dart';
import 'package:test_app/features/cubit/home_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDI() async {
  getIt.registerSingleton<HomeCubit>(HomeCubit());
}
