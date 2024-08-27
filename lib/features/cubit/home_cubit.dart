import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/features/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  void initData() {
    state.cartValueTextEditingController?.text = 1.toString();
    emit(state.copyWith(isShowError: false));
  }
}
