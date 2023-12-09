import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(resource: Initial(), count: 0));


  void plusCount() async {
    emit(state.copyWith(resource: const Loading()));

    await Future.delayed(const Duration(seconds: 3));

    emit(
      state.copyWith(resource: const Success(), count: state.count + 1),
    );
  }

  void minusCount() {
    emit(
      state.copyWith(resource: const Success(), count: state.count - 1),
    );
  }
}
