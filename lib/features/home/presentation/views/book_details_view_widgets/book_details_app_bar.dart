import 'package:flutter/material.dart';
import 'package:flutter_back/core/utilities/components.dart';
import 'package:flutter_back/features/cart/presentation/views/cart_view.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 30, right: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.close, size: 30),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              navigateTo(context, const CartView());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Colors.grey.shade800),
              child: const Text(
                'favorites',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
