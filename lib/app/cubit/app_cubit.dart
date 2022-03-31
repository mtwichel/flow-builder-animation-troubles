import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<int> {
  AppCubit() : super(0);

  void update(int i) => emit(i);
}
