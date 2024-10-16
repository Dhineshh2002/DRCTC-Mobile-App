import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String buttonLabel;
  final GlobalKey<FormState>? formKey;

  const CommonButton({
    required this.buttonLabel,
    this.formKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 58,
      child: FilledButton(
        onPressed: () {
          if (formKey != null) { // usefully in future
            if (formKey!.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
            }
          }
        },
        style: FilledButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(buttonLabel),
      ),
    );
  }
}
