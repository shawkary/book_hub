import 'package:flutter/material.dart';
import 'package:flutter_back/features/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:flutter_back/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:flutter_back/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CartCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Favorites'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              FavoriteCubit cubit = BlocProvider.of(context);
              return IconButton(
                  onPressed: () {
                    cubit.gg();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back));
            },
          ),
        ),
        body: const CartViewBody(),
      ),
    );
  }
}
