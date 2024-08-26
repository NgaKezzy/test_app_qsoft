import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/core/config/constraints.dart';
import 'package:test_app/core/theme/cubit/theme_state.dart';


class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());
  Future<void> toggedTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(state.copyWith(status: ThemeStatus.loading));
    emit(state.copyWith(isDark: !state.isDark, status: ThemeStatus.success));
    prefs.setBool(Constraints.IS_DARK, state.isDark);
  }

  Future<void> initTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(state.copyWith(status: ThemeStatus.loading));
    bool value = prefs.getBool(Constraints.IS_DARK) ?? false;
    emit(state.copyWith(isDark: value, status: ThemeStatus.success));
  }
}
