import 'package:flutter/material.dart';

Widget searchBox({
  required SearchDelegate<dynamic> delegate,
  required BuildContext context,
  required String label,
}) {
  return InkWell(
    onTap: () => showSearch(
      context: context,
      delegate: delegate,
    ),
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            const Icon(Icons.search),
            const Spacer(),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    ),
  );
}
