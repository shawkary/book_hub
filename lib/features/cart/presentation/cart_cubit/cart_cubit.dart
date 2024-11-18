import 'package:equatable/equatable.dart';
import 'package:flutter_back/core/utilities/components.dart';
import 'package:flutter_back/core/utilities/shared_preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  void deleteItems(int index) {
    emit(CartLoadingState());
    everythingList.removeRange(index * 4, index * 4 + 4);
    CacheHelper.saveList('everythingList', everythingList);
    emit(CartSucessState());
  }
}
