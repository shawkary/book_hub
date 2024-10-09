import 'package:flutter/material.dart';
import 'package:flutter_back/features/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:flutter_back/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CartCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
          centerTitle: true,
        ),
        body: const CartViewBody(),
      ),
    );
  }
}