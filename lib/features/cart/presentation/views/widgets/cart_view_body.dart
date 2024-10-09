import 'package:flutter/material.dart';
import 'package:flutter_back/core/utilities/components.dart';
import 'package:flutter_back/features/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:flutter_back/features/cart/presentation/views/widgets/cart_list_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return CartListViewItem(index: index, cubit: BlocProvider.of(context));
            },
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: everythingList.length ~/ 4,
          ),
        );
      },
    );
  }
}
