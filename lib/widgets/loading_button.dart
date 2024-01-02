import 'package:flutter/material.dart';
import 'package:hows_life/theme.dart';

class LoadingButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: CircularProgressIndicator(strokeWidth: 2),
                width: 16,
                height: 16,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                'Memuat',
                style: textMain.copyWith(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: kColorButton,
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
