import 'package:clean_arch_bookly_app/core/base_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            title: "Free",
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            title: "Free preview",
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            borderRadius: BorderRadiusGeometry.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
