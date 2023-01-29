import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  const RoundButton(
      {Key? key,
      required this.onpress,
      required this.title,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.buttonColr),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: const TextStyle(color: AppColors.whiteColor),
                  )),
      ),
    );
  }
}
