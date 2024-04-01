import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerification extends StatelessWidget {
  const PinVerification({
    super.key,
    required this.pinController,
  });
  final TextEditingController pinController;


  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: pinController,
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        activeColor: Colors.green,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: (v) {
        // OTP completed logic can be added here
        // For example, you can call a method to validate the OTP
        //controller.validateOTP();
      },
      onChanged: (value) {},
      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
  }
}