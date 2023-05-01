import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCard extends StatelessWidget {
  final String title;
  final int amount;
  final String unit;
  final IconData iconData;
  final int order;

  const MyCard({
    super.key,
    required this.title,
    required this.amount,
    required this.unit,
    required this.iconData,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, order * -30.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 40,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 16,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      NumberFormat('###,###,###,###,###,###,###')
                          .format(amount),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      unit,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                Transform.scale(
                  scale: 3,
                  child: Transform.translate(
                    offset: const Offset(5, 9),
                    child: Icon(
                      iconData,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
