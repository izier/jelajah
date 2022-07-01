import 'package:bloc/bloc.dart';

class MainIndexCubit extends Cubit<int> {
  MainIndexCubit() : super(0);

  void setIndexPage(int index) => emit(index);
}
