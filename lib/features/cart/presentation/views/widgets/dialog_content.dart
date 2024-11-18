import 'package:flutter/material.dart';
import 'package:flutter_back/features/cart/presentation/cart_cubit/cart_cubit.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({super.key, required this.index, required this.cubit});
  final int index;
  final CartCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 300),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Are you sure?',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            const Spacer(),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('cancel',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      cubit.deleteItems(index);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(seconds: 1), content: Text('Deleted successfully')));
                      Navigator.pop(context);
                    },
                    child: const Text('ok',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}