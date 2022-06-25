import 'package:bloc/bloc.dart';

class HomeIndexCubit extends Cubit<int> {
  HomeIndexCubit() : super(0);

  void setIndexPage(int index) => emit(index);
}
