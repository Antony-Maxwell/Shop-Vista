
import 'package:flutter/material.dart';

class CouponCodeContainer extends StatelessWidget {
  const CouponCodeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder()),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 0,
              child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text('Apply here'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
